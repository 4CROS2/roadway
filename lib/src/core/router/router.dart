import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roadway/src/core/router/branch/branches.dart';
import 'package:roadway/src/core/router/branch/shell_branches.dart';
import 'package:roadway/src/core/router/redirect/router_redirect.dart';
import 'package:roadway/src/features/shell/presentation/page/shell.dart';

class AppRouter {
  const AppRouter._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<StatefulNavigationShellState> shellNavigatorKey =
      GlobalKey<StatefulNavigationShellState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: '/home',
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    redirect: RouterRedirect.call,
    routes: [
      StatefulShellRoute.indexedStack(
        key: shellNavigatorKey,
        parentNavigatorKey: navigatorKey,
        builder: (_, _, navigationShell) => Shell(child: navigationShell),
        branches: ShellBranches.routes,
      ),
      ...Branches.routes,
    ],
  );
}
