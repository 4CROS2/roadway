package com.crossdev.roadway.roadway_native_navigation

import android.content.Context
import android.view.View
import com.google.android.material.bottomnavigation.BottomNavigationView
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import io.flutter.plugin.common.StandardMessageCodec

class RoadwayNativeNavigationPlugin : FlutterPlugin {
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        binding.platformViewRegistry.registerViewFactory(
            VIEW_TYPE,
            NativeNavigationBarFactory(binding.binaryMessenger),
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) = Unit

    private companion object {
        const val VIEW_TYPE = "roadway_native_navigation/navigation_bar"
    }
}

private class NativeNavigationBarFactory(
    private val messenger: BinaryMessenger,
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return NativeNavigationBarPlatformView(context, messenger, viewId, args)
    }
}

private class NativeNavigationBarPlatformView(
    context: Context,
    messenger: BinaryMessenger,
    viewId: Int,
    args: Any?,
) : PlatformView {
    private val navigationView = BottomNavigationView(context)
    private val channel = MethodChannel(
        messenger,
        "roadway_native_navigation/navigation_bar/$viewId",
    )
    private val items = args.asNavigationItems()

    init {
        val selectedIndex = args.selectedIndex(items.size)
        items.forEachIndexed { index, item ->
            navigationView.menu.add(0, index, index, item.label).setIcon(item.icon.drawable)
        }
        navigationView.selectedItemId = selectedIndex
        navigationView.setOnItemSelectedListener { menuItem ->
            channel.invokeMethod("onItemSelected", menuItem.itemId)
            true
        }
        channel.setMethodCallHandler { call, result ->
            if (call.method != "setSelectedIndex") {
                result.notImplemented()
                return@setMethodCallHandler
            }

            val index = (call.arguments as? Number)?.toInt()
            if (index == null || index !in items.indices) {
                result.error("invalid-selection", "The native navigation item index is invalid.", null)
                return@setMethodCallHandler
            }

            if (navigationView.selectedItemId != index) {
                navigationView.selectedItemId = index
            }
            result.success(null)
        }
    }

    override fun getView(): View = navigationView

    override fun dispose() {
        channel.setMethodCallHandler(null)
    }
}

private data class NativeNavigationItem(val label: String, val icon: NativeNavigationIcon)

private enum class NativeNavigationIcon(val drawable: Int) {
    HOME(android.R.drawable.ic_menu_myplaces),
    SEARCH(android.R.drawable.ic_menu_search),
    FAVORITES(android.R.drawable.btn_star_big_on),
    PROFILE(android.R.drawable.ic_menu_manage),
}

private fun Any?.asNavigationItems(): List<NativeNavigationItem> {
    val arguments = this as? Map<*, *> ?: error("Native navigation arguments are required.")
    val rawItems = arguments["items"] as? List<*> ?: error("Native navigation items are required.")
    check(rawItems.isNotEmpty() && rawItems.size <= 5) {
        "Native navigation requires between one and five items."
    }
    return rawItems.map { rawItem ->
        val item = rawItem as? Map<*, *> ?: error("A native navigation item is invalid.")
        val label = item["label"] as? String ?: error("A native navigation label is required.")
        val icon = item["icon"] as? String ?: error("A native navigation icon is required.")
        NativeNavigationItem(label, NativeNavigationIcon.valueOf(icon.uppercase()))
    }
}

private fun Any?.selectedIndex(itemCount: Int): Int {
    val arguments = this as? Map<*, *> ?: error("Native navigation arguments are required.")
    val selectedIndex = (arguments["selectedIndex"] as? Number)?.toInt()
        ?: error("The selected native navigation item is required.")
    check(selectedIndex in 0 until itemCount) {
        "The selected native navigation item index is invalid."
    }
    return selectedIndex
}
