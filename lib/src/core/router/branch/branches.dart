import 'package:go_router/go_router.dart';
import 'package:roadway/src/core/router/branch/branch.dart';
import 'package:roadway/src/features/login/presentation/page/login_page.dart';

class Branches {
  static final List<Branch> _all = <Branch>[
    .register(path: '/login', builder: (_, _) => const LoginPage()),
  ];

  static List<GoRoute> get routes =>
      _all.map((Branch branch) => branch.toGoRoute()).toList(growable: false);
}
