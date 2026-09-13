import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class RemoteColors extends Equatable {
  const RemoteColors({
    required this.primaryColor,
    required this.primaryLightColor,
    required this.scaffoldBackgroundColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
  });

  const RemoteColors.empty()
    : primaryColor = const Color(0xFFFFFFFF),
      primaryLightColor = const Color(0xFFFFFFFF),
      scaffoldBackgroundColor = const Color(0xFFFFFFFF),
      primaryTextColor = const Color(0xFF000000),
      secondaryTextColor = const Color(0xFF000000);

  final Color primaryColor;
  final Color primaryLightColor;
  final Color scaffoldBackgroundColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;

  @override
  List<Object?> get props => [
    primaryColor,
    primaryLightColor,
    scaffoldBackgroundColor,
    primaryTextColor,
    secondaryTextColor,
  ];
}

class LightRemoteColors extends RemoteColors {
  const LightRemoteColors({
    required super.primaryColor,
    required super.primaryLightColor,
    required super.scaffoldBackgroundColor,
    required super.primaryTextColor,
    required super.secondaryTextColor,
  });
  const LightRemoteColors.empty() : super.empty(); 
}

class DarkRemoteColors extends RemoteColors {
  const DarkRemoteColors({
    required super.primaryColor,
    required super.primaryLightColor,
    required super.scaffoldBackgroundColor,
    required super.primaryTextColor,
    required super.secondaryTextColor,
  });
  const DarkRemoteColors.empty() : super.empty();
}
