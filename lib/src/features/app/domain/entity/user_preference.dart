import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserPreference extends Equatable {
  const UserPreference({
    required this.themeMode,
    required this.notificationsEnabled,
    required this.languageCode,
  });

  const UserPreference.empty()
    : themeMode = .light,
      notificationsEnabled = true,
      languageCode = 'es';

  final ThemeMode themeMode;
  final bool notificationsEnabled;
  final String languageCode;

  UserPreference copyWith({
    ThemeMode? themeMode,
    bool? notificationsEnabled,
    String? languageCode,
  }) {
    return UserPreference(
      themeMode: themeMode ?? this.themeMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      languageCode: languageCode ?? this.languageCode,
    );
  }

  @override
  List<Object?> get props => [themeMode, notificationsEnabled, languageCode];
}
