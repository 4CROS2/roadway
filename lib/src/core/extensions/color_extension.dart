import 'dart:ui';

extension ColorExtension on int {
  Color toColor() => Color(this);
}

extension ColorExtensionString on String {
  Color toColor() => Color(int.parse(replaceFirst('0x', ''), radix: 16));
}
