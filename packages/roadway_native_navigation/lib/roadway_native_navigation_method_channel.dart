import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'roadway_native_navigation_platform_interface.dart';

/// An implementation of [RoadwayNativeNavigationPlatform] that uses method channels.
class MethodChannelRoadwayNativeNavigation extends RoadwayNativeNavigationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('roadway_native_navigation');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
