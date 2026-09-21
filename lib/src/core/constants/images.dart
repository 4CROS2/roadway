import 'package:roadway/src/core/ui/image_loader.dart';

enum AppImages {
  icon(path: 'assets/icons/ic_roadway.png',source: .asset, format: .png);

  const AppImages({
    required this.path,
    required this.source,
    required this.format,
  });

  final String path;
  final ImageSourceType source;
  final ImageFormat format;
}
