import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Branch extends Equatable {
  const Branch._({
    required this.path,
    required this.name,
    required this.builder,
    this.routes = const <RouteBase>[],
    this.navigatorKey,
  });

  factory Branch.register({
    required String path,
    required Widget Function(BuildContext context, GoRouterState state) builder,
    String? name,
    List<RouteBase> routes = const [],
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    return Branch._(
      path: path,
      name: name ?? _deriveName(path),
      builder: builder,
      routes: routes,
      navigatorKey: navigatorKey,
    );
  }

  final String path;
  final String name;
  final Widget Function(BuildContext context, GoRouterState state) builder;
  final List<RouteBase> routes;
  final GlobalKey<NavigatorState>? navigatorKey;

  /// Convierte la abstracción a un [StatefulShellBranch] de GoRouter.
  StatefulShellBranch toStatefulShellBranch() {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(path: path, name: name, builder: builder, routes: routes),
      ],
    );
  }

  /// Convierte la abstracción a un [GoRoute] de GoRouter.
  GoRoute toGoRoute() {
    return GoRoute(
      path: path,
      name: name,
      builder: builder,
      routes: routes,
    );
  }

  /// Infiere el nombre del path limpiando slashes.
  /// Ejemplos: '/home' -> 'home', '/user/profile' -> 'user-profile', '/' -> 'root'
  static String _deriveName(String path) {
    final clean = path.trim().replaceAll(RegExp(r'^/|/$'), '');
    if (clean.isEmpty) return 'root';
    return clean.replaceAll('/', '-');
  }

  @override
  List<Object?> get props => [path, name, routes, navigatorKey];
}
