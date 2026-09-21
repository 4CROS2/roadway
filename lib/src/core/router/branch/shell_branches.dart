import 'package:go_router/go_router.dart';
import 'package:roadway/src/core/router/branch/branch.dart';
import 'package:roadway/src/features/home/presentation/page/home_page.dart';
import 'package:roadway/src/features/profile/presentation/page/profile_page.dart';
import 'package:roadway/src/features/search/presentation/page/search_page.dart';

class ShellBranches {
  static final List<Branch> _all = <Branch>[
    .register(path: '/home', builder: (_, _) => const HomePage()),
    .register(path: '/search', builder: (_, _) => const SearchPage()),
    .register(path: '/profile', builder: (_, _) => const ProfilePage()),
  ];

  static List<StatefulShellBranch> get routes =>
      _all.map((branch) => branch.toStatefulShellBranch()).toList();
}
