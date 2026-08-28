import 'package:flutter/material.dart';
import 'package:roadway/src/core/environment/appwrite/appwrite_init.dart';
import 'package:roadway/src/features/app/presentation/page/app_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Appwrite.init();
  runApp(const AppPage());
}
