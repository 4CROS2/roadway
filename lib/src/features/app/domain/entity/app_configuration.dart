import 'package:equatable/equatable.dart';
import 'package:roadway/src/features/app/domain/entity/remote_colors.dart';
import 'package:roadway/src/features/app/domain/entity/user_preference.dart';

class AppConfiguration extends Equatable {
  const new({
    required this.darkRemoteColors,
    required this.lightRemoteColors,
    required this.userPreference,
  });

  const AppConfiguration.empty()
    : lightRemoteColors = const .empty(),
      darkRemoteColors = const .empty(),
      userPreference = const .empty();

  final LightRemoteColors lightRemoteColors;
  final DarkRemoteColors darkRemoteColors;
  final UserPreference userPreference;

  AppConfiguration copyWith({
    LightRemoteColors? lightRemoteColors,
    DarkRemoteColors? darkRemoteColors,
    UserPreference? userPreference,
  }) {
    return AppConfiguration(
      lightRemoteColors: lightRemoteColors ?? this.lightRemoteColors,
      darkRemoteColors: darkRemoteColors ?? this.darkRemoteColors,
      userPreference: userPreference ?? this.userPreference,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
    lightRemoteColors,
    darkRemoteColors,
    userPreference,
  ];
}
