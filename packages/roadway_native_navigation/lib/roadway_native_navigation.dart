
import 'roadway_native_navigation_platform_interface.dart';

class RoadwayNativeNavigation {
  Future<String?> getPlatformVersion() {
    return RoadwayNativeNavigationPlatform.instance.getPlatformVersion();
  }
}
