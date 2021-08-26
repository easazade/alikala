import 'package:alikala/core/constants.dart';
import 'package:flutter/material.dart';

class StatusBarBackground extends StatelessWidget {
  final Color? color;

  const StatusBarBackground({this.color});

  @override
  Widget build(BuildContext context) => Container(
        color: color ?? AppColors.THEME_ACCENT,
        height: MediaQuery.of(context).padding.top,
      );
}
