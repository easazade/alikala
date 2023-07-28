import 'package:alikala/core/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppProgress extends StatelessWidget {
  final bool isSmall = false;
  final bool isLarge;
  final double? size;
  final double? padding;
  final Color? color;

  const AppProgress(this.size, this.padding, {this.color}) : isLarge = false;

  const AppProgress.large({this.color})
      : size = null,
        padding = null,
        isLarge = true;

  const AppProgress.small({this.color})
      : size = null,
        padding = null,
        isLarge = false;

  @override
  Widget build(BuildContext context) {
    final progressColor = color ?? Theme.of(context).primaryColor;

    if (isSmall) {
      return SizedBox(
        height: 20,
        width: 20,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(progressColor),
          ),
        ),
      );
    } else if (isLarge) {
      return SizedBox(
        height: 55,
        width: 55,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CircularProgressIndicator(
            strokeWidth: 1,
            valueColor: AlwaysStoppedAnimation(progressColor),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: size,
        width: size,
        child: Padding(
          padding: (padding != null) ? EdgeInsets.all(padding!) : EdgeInsets.all(0),
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(progressColor),
          ),
        ),
      );
    }
  }
}
