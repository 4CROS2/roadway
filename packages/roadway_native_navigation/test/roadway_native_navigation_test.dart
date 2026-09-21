import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roadway_native_navigation/roadway_native_navigation.dart';

void main() {
  testWidgets('does not render a platform view on unsupported platforms', (
    WidgetTester tester,
  ) async {
    // Arrange
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;

    // Act
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: NativeNavigationBar(
          items: const <NativeNavigationItem>[
            NativeNavigationItem(
              label: 'Home',
              icon: NativeNavigationIcon.home,
            ),
          ],
          selectedIndex: 0,
          onItemSelected: (_) {},
        ),
      ),
    );

    // Assert
    expect(find.byType(AndroidView), findsNothing);
    expect(find.byType(UiKitView), findsNothing);
    debugDefaultTargetPlatformOverride = null;
  });

  test('rejects an out-of-range selected index', () {
    // Arrange / Act / Assert
    expect(
      () => NativeNavigationBar(
        items: const <NativeNavigationItem>[
          NativeNavigationItem(label: 'Home', icon: NativeNavigationIcon.home),
        ],
        selectedIndex: 1,
        onItemSelected: (_) {},
      ),
      throwsAssertionError,
    );
  });
}
