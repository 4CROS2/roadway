import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:roadway/src/core/router/branch/shell_branches.dart';

void main() {
  test('registers a shell branch for every native navigation item', () {
    // Arrange
    final List<StatefulShellBranch> branches = ShellBranches.routes;

    // Act
    final List<String> paths = branches
        .map((StatefulShellBranch branch) => branch.routes.single)
        .cast<GoRoute>()
        .map((GoRoute route) => route.path)
        .toList(growable: false);

    // Assert
    expect(paths, <String>['/home', '/search', '/profile']);
  });
}
