import 'package:go_router/go_router.dart';
import 'package:roadway/src/core/router/branch/branch.dart';
import 'package:roadway/src/features/home/presentation/page/home_page.dart';

class ShellBranches {
  static final List<Branch> _all = <Branch>[
    .register(path: '/home', builder: (_, _) => const HomePage()),
    //.register(path: '/login', builder: (_, _) => const LoginPage()),
  ];

  static List<StatefulShellBranch> get routes =>
      _all.map((branch) => branch.toStatefulShellBranch()).toList();
}
