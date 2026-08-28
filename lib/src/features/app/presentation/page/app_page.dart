import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roadway/src/core/router/router.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter.router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Roadway', routerConfig: _router);
  }
}
