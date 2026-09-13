import 'dart:ui';

import 'package:roadway/src/core/entities/json.dart';
import 'package:roadway/src/core/extensions/color_extension.dart';
import 'package:roadway/src/features/app/domain/entity/remote_colors.dart';

abstract class RemoteColorsModel extends RemoteColors {
  const new({
    required super.primaryColor,
    required super.primaryLightColor,
    required super.scaffoldBackgroundColor,
    required super.primaryTextColor,
    required super.secondaryTextColor,
  });

  const RemoteColorsModel.empty() : super.empty();

  static Color parseColor(String value) {
    return value.toColor();
  }
}

class LightRemoteColorsModel extends RemoteColorsModel
    implements LightRemoteColors {
  const new({
    required super.primaryColor,
    required super.primaryLightColor,
    required super.scaffoldBackgroundColor,
    required super.primaryTextColor,
    required super.secondaryTextColor,
  });

  factory LightRemoteColorsModel.fromJson({required Json json}) {
    return LightRemoteColorsModel(
      primaryColor: RemoteColorsModel.parseColor(
        json['light_primary_color'] as String,
      ),
      primaryLightColor: RemoteColorsModel.parseColor(
        json['light_primary_light_color'] as String,
      ),
      scaffoldBackgroundColor: RemoteColorsModel.parseColor(
        json['light_scaffold_bg'] as String,
      ),
      primaryTextColor: RemoteColorsModel.parseColor(
        json['light_primary_text_color'] as String,
      ),
      secondaryTextColor: RemoteColorsModel.parseColor(
        json['light_secondary_text_color'] as String,
      ),
    );
  }
}


class DarkRemoteColorsModel extends RemoteColorsModel
    implements DarkRemoteColors {
  const new({
    required super.primaryColor,
    required super.primaryLightColor,
    required super.scaffoldBackgroundColor,
    required super.primaryTextColor,
    required super.secondaryTextColor,
  });

  factory DarkRemoteColorsModel.fromJson({required Json json}) {
    return DarkRemoteColorsModel(
      primaryColor: RemoteColorsModel.parseColor(
        json['dark_primary_color'] as String,
      ),
      primaryLightColor: RemoteColorsModel.parseColor(
        json['dark_primary_light_color'] as String,
      ),
      scaffoldBackgroundColor: RemoteColorsModel.parseColor(
        json['dark_scaffold_bg'] as String,
      ),
      primaryTextColor: RemoteColorsModel.parseColor(
        json['dark_primary_text_color'] as String,
      ),
      secondaryTextColor: RemoteColorsModel.parseColor(
        json['dark_secondary_text_color'] as String,
      ),
    );
  }
}