import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'roadway_native_navigation_method_channel.dart';

abstract class RoadwayNativeNavigationPlatform extends PlatformInterface {
  /// Constructs a RoadwayNativeNavigationPlatform.
  RoadwayNativeNavigationPlatform() : super(token: _token);

  static final Object _token = Object();

  static RoadwayNativeNavigationPlatform _instance = MethodChannelRoadwayNativeNavigation();

  /// The default instance of [RoadwayNativeNavigationPlatform] to use.
  ///
  /// Defaults to [MethodChannelRoadwayNativeNavigation].
  static RoadwayNativeNavigationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RoadwayNativeNavigationPlatform] when
  /// they register themselves.
  static set instance(RoadwayNativeNavigationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
