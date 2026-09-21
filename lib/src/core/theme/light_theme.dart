import 'package:flutter/material.dart';
import 'package:roadway/src/core/constants/constants.dart';
import 'package:roadway/src/features/app/domain/entity/remote_colors.dart';

class LightTheme {
  static ThemeData fromRemoteColors(RemoteColors remoteColors) {
    return ThemeData(
      brightness: .light,
      fontFamily: AppConstants.primaryFont,
      scaffoldBackgroundColor: remoteColors.scaffoldBackgroundColor,
      colorScheme: ColorScheme.light(
        primary: remoteColors.primaryColor,
        //secondary: remoteColors.secondaryColor,
        surface: remoteColors.scaffoldBackgroundColor,
      ),
    );
        
  }
}
