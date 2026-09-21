# roadway_native_navigation

Renders a native Android `BottomNavigationView` or iOS `UITabBar`. It does not
own navigation state: use the selected callback to delegate transitions to
`go_router`.

```dart
NativeNavigationBar(
  items: const <NativeNavigationItem>[
    NativeNavigationItem(label: 'Home', icon: NativeNavigationIcon.home),
  ],
  selectedIndex: navigationShell.currentIndex,
  onItemSelected: navigationShell.goBranch,
)
```

Provide between one and five items. The selected index is synchronized from
Flutter to the native control, while taps are sent back through
`onItemSelected`.
