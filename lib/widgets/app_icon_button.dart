import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  const AppIconButton({
    required this.icon,
    required this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    var icon = this.icon;
    return GestureDetector(
      onTap: onTap,
      child: (padding == null) ? icon : Padding(padding: padding!, child: icon),
    );
  }
}
