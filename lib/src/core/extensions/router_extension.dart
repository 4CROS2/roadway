import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension RouterExtension on BuildContext {
  String get currentRoute => GoRouter.of(this).state.matchedLocation;
  String? get currentRouteName => GoRouter.of(this).state.name;
}
