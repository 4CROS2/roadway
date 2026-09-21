import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String _viewType = 'roadway_native_navigation/navigation_bar';
const String _channelPrefix = 'roadway_native_navigation/navigation_bar/';

enum NativeNavigationIcon { home, search, favorites, profile }

class NativeNavigationItem {
  const NativeNavigationItem({required this.label, required this.icon});

  final String label;
  final NativeNavigationIcon icon;

  Map<String, Object> toCreationParams() => <String, Object>{
    'label': label,
    'icon': icon.name,
  };
}

class NativeNavigationBar extends StatefulWidget {
  NativeNavigationBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : assert(items.isNotEmpty, 'Native navigation requires at least one item'),
       assert(
         items.length <= 5,
         'Native navigation supports at most five items',
       ),
       assert(
         selectedIndex >= 0 && selectedIndex < items.length,
         'selectedIndex must identify an item',
       );

  final List<NativeNavigationItem> items;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  @override
  State<NativeNavigationBar> createState() => _NativeNavigationBarState();
}

class _NativeNavigationBarState extends State<NativeNavigationBar> {
  MethodChannel? _channel;

  @override
  void didUpdateWidget(covariant NativeNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _channel?.invokeMethod<void>('setSelectedIndex', widget.selectedIndex);
    }
  }

  @override
  void dispose() {
    _channel?.setMethodCallHandler(null);
    super.dispose();
  }

  void _onPlatformViewCreated(int viewId) {
    final MethodChannel channel = MethodChannel('$_channelPrefix$viewId');
    channel.setMethodCallHandler(_handleMethodCall);
    _channel = channel;
  }

  Future<void> _handleMethodCall(MethodCall call) async {
    if (call.method != 'onItemSelected') {
      throw MissingPluginException('Unsupported method: ${call.method}');
    }

    final Object? arguments = call.arguments;
    if (arguments is! int ||
        arguments < 0 ||
        arguments >= widget.items.length) {
      throw PlatformException(
        code: 'invalid-selection',
        message: 'The native navigation item index is invalid.',
      );
    }

    widget.onItemSelected(arguments);
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return SizedBox(
        height: 80,
        child: AndroidView(
          viewType: _viewType,
          onPlatformViewCreated: _onPlatformViewCreated,
          creationParams: _creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    }

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return SizedBox(
        height: 49,
        child: UiKitView(
          viewType: _viewType,
          onPlatformViewCreated: _onPlatformViewCreated,
          creationParams: _creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Map<String, Object> get _creationParams => <String, Object>{
    'items': widget.items
        .map((NativeNavigationItem item) => item.toCreationParams())
        .toList(growable: false),
    'selectedIndex': widget.selectedIndex,
  };
}
