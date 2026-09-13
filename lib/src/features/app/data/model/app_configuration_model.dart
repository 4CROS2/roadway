import 'package:roadway/src/core/entities/json.dart';
import 'package:roadway/src/features/app/data/model/remote_colors_model.dart';
import 'package:roadway/src/features/app/data/model/user_preference_model.dart';
import 'package:roadway/src/features/app/domain/entity/app_configuration.dart';

class AppConfigurationModel extends AppConfiguration {
  const new({
    required super.lightRemoteColors,
    required super.darkRemoteColors,
    required super.userPreference,
  });

  factory AppConfigurationModel.fromJson({required Json json}) {
    return AppConfigurationModel(
      lightRemoteColors: LightRemoteColorsModel.fromJson(json: json),
      darkRemoteColors: DarkRemoteColorsModel.fromJson(json: json),
      userPreference: UserPreferenceModel.empty(),
    );
  }
}
