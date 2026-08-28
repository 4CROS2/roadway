import 'package:flutter/material.dart';

class Shell extends StatefulWidget {
  const Shell({super.key, required this.child});
  final Widget child;

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: widget.child);
  }
}
