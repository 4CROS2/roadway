import 'package:equatable/equatable.dart';
import 'package:roadway/src/features/app/domain/entity/remote_colors.dart';
import 'package:roadway/src/features/app/domain/entity/user_preference.dart';

class AppConfiguration extends Equatable {
  const AppConfiguration({
    required this.remoteColors,
    required this.userPreference,
  });

  const AppConfiguration.empty()
    : remoteColors = const LightRemoteColors.empty(),
      userPreference = const .empty();

  final RemoteColors remoteColors;
  final UserPreference userPreference;

  AppConfiguration copyWith({
    RemoteColors? remoteColors,
    UserPreference? userPreference,
  }) {
    return AppConfiguration(
      remoteColors: remoteColors ?? this.remoteColors,
      userPreference: userPreference ?? this.userPreference,
    );
  }

  @override
  List<Object?> get props => [remoteColors, userPreference];
}
