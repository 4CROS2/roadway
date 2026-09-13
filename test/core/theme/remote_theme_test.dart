import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roadway/src/core/theme/theme.dart';
import 'package:roadway/src/features/app/domain/entity/remote_colors.dart';

void main() {
  const lightColors = LightRemoteColors(
    primaryColor: Color(0xFF123456),
    primaryLightColor: Color(0xFF234567),
    scaffoldBackgroundColor: Color(0xFF345678),
    primaryTextColor: Color(0xFF456789),
    secondaryTextColor: Color(0xFF56789A),
  );
  const darkColors = DarkRemoteColors(
    primaryColor: Color(0xFF654321),
    primaryLightColor: Color(0xFF765432),
    scaffoldBackgroundColor: Color(0xFF876543),
    primaryTextColor: Color(0xFF987654),
    secondaryTextColor: Color(0xFFA98765),
  );

  group('remote themes', () {
    test('builds the light theme from the latest remote colors', () {
      final theme = LightTheme.fromRemoteColors(lightColors);

      expect(theme.brightness, Brightness.light);
      expect(theme.colorScheme.primary, lightColors.primaryColor);
      expect(
        theme.scaffoldBackgroundColor,
        lightColors.scaffoldBackgroundColor,
      );
    });

    test('builds the dark theme from the latest remote colors', () {
      final theme = DarkTheme.fromRemoteColors(darkColors);

      expect(theme.brightness, Brightness.dark);
      expect(theme.colorScheme.primary, darkColors.primaryColor);
      expect(theme.scaffoldBackgroundColor, darkColors.scaffoldBackgroundColor);
    });
  });
}
