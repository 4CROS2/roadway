import 'package:flutter/foundation.dart';

class Environment {
  static const Environment _instance = Environment._internal();

  const Environment._internal();

  factory Environment() => _instance;

  // Se agrega 'const' al invocar String.fromEnvironment
  final String apiBaseUrl = const String.fromEnvironment('APPWRITE_ENDPOINT');
  final String projectId = const String.fromEnvironment('APPWRITE_PROJECT_ID');
  final String projectName = const String.fromEnvironment(
    'APPWRITE_PROJECT_NAME',
  );
  final String databaseId = const String.fromEnvironment('DATABASE_ID');
  final String appConfig = const String.fromEnvironment('APP_CONFIG');
  final String userSettingsTable = const String.fromEnvironment('USER_SETTINGS');
  bool get isDebug => kDebugMode;
}
