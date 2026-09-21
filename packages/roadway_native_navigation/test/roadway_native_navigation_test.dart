import 'package:flutter_test/flutter_test.dart';
import 'package:roadway_native_navigation/roadway_native_navigation.dart';
import 'package:roadway_native_navigation/roadway_native_navigation_platform_interface.dart';
import 'package:roadway_native_navigation/roadway_native_navigation_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRoadwayNativeNavigationPlatform
    with MockPlatformInterfaceMixin
    implements RoadwayNativeNavigationPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final RoadwayNativeNavigationPlatform initialPlatform = RoadwayNativeNavigationPlatform.instance;

  test('$MethodChannelRoadwayNativeNavigation is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRoadwayNativeNavigation>());
  });

  test('getPlatformVersion', () async {
    RoadwayNativeNavigation roadwayNativeNavigationPlugin = RoadwayNativeNavigation();
    MockRoadwayNativeNavigationPlatform fakePlatform = MockRoadwayNativeNavigationPlatform();
    RoadwayNativeNavigationPlatform.instance = fakePlatform;

    expect(await roadwayNativeNavigationPlugin.getPlatformVersion(), '42');
  });
}
