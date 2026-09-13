import 'package:flutter/material.dart';
import 'package:roadway/injection_container.dart';
import 'package:roadway/src/features/app/presentation/page/app_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectionContainer();
  runApp(const AppPage());
}
