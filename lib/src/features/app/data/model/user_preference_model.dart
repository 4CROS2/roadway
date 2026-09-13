import 'package:flutter/material.dart';
import 'package:roadway/src/core/entities/json.dart';
import 'package:roadway/src/features/app/domain/entity/user_preference.dart';

class UserPreferenceModel extends UserPreference {
  const new({
    required super.themeMode,
    required super.notificationsEnabled,
    required super.languageCode,
  });

  factory UserPreferenceModel.empty() => UserPreferenceModel(
        themeMode: ThemeMode.system,
        notificationsEnabled: true,
        languageCode: 'en',
      );

  factory UserPreferenceModel.fromJson({required Json json}) {
    return UserPreferenceModel(
      themeMode: ThemeMode.system,
      notificationsEnabled: json['notificationsEnabled'] as bool,
      languageCode: json['languageCode'] as String,
    );
  }
}
