import 'package:roadway/src/core/entities/json.dart';
import 'package:roadway/src/features/app/data/model/user_preference_model.dart';
import 'package:roadway/src/features/app/domain/entity/app_configuration.dart';
import 'package:roadway/src/features/app/domain/entity/remote_colors.dart';

class AppConfigurationModel extends AppConfiguration {
  const new({
    required super.remoteColors,
    required super.userPreference,
  });

  factory AppConfigurationModel.fromJson({required Json json}) {
    return AppConfigurationModel(
      remoteColors: LightRemoteColors.empty(),
      userPreference: UserPreferenceModel.empty(),
    );
  }
}
