import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roadway/src/core/constants/images.dart';
import 'package:roadway_native_navigation/roadway_native_navigation.dart';

class Shell extends StatefulWidget {
  const Shell({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.yellow,
      extendBody: true,
      body: widget.child,
      bottomNavigationBar: SafeArea(
        child: NativeNavigationBar(
          items: <NativeNavigationItem>[
            NativeNavigationItem(
              label: 'Inicio',
              icon: NativeNavigationIcon.home,
            ),
            NativeNavigationItem(
              label: 'Buscar',
              icon: NativeNavigationIcon.search,
            ),
            .new(icon: .favorites, label: 'Perfil'),
            .new(label: 'Custom', iconAsset: AppImages.icon.path),
            //.new(icon: .favorites, label: 'Favoritos'),
          ],
          selectedIndex: widget.child.currentIndex,
          onItemSelected: (int index) => widget.child.goBranch(index),
        ),
      ),
    );
  }
}
