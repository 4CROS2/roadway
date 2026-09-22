import 'package:flutter/material.dart';
import 'package:roadway/src/core/constants/constants.dart';
import 'package:roadway/src/features/app/domain/entity/remote_colors.dart';

class DarkTheme {
  static ThemeData fromRemoteColors(RemoteColors remoteColors) {
    return ThemeData(
      brightness: .dark,
      fontFamily: AppConstants.primaryFont,
      scaffoldBackgroundColor: remoteColors.scaffoldBackgroundColor,
      colorScheme: .dark(primary: remoteColors.primaryColor),
      textTheme: TextTheme(),
       inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: .circular(14)),
      )
    );
  }
}
