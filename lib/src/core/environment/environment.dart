import 'package:flutter/foundation.dart';

class Environment {
  static const Environment _instance = Environment._internal();

  const Environment._internal();

  factory Environment() => _instance;

  // Se agrega 'const' al invocar String.fromEnvironment
  final String apiBaseUrl = const String.fromEnvironment('APPWRITEENDPOINT');
  final String projectId = const String.fromEnvironment('APPWRITEPROJECTID');
  final String projectName = const String.fromEnvironment(
    'APPWRITEPROJECTNAME',
  );
  bool get isDebug => kDebugMode;
}
