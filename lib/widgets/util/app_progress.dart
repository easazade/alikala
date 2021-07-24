import 'package:alikala/core/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppProgress extends StatelessWidget {
  bool isSmall = false;
  bool isLarge = false;
  double? size;
  double? padding;
  Color color;

  AppProgress(this.size, this.padding, {this.color = AppColors.THEME_ACCENT});

  AppProgress.large({this.color = AppColors.THEME_ACCENT})
      : size = null,
        padding = null {
    isLarge = true;
  }

  AppProgress.small({this.color = AppColors.THEME_ACCENT})
      : size = null,
        padding = null {
    isSmall = true;
  }

  @override
  Widget build(BuildContext context) {
    if (isSmall)
      return SizedBox(
        height: 20,
        width: 20,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor:  AlwaysStoppedAnimation(color) ,
          ),
        ),
      );
    else if (isLarge)
      return SizedBox(
        height: 55,
        width: 55,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CircularProgressIndicator(
            strokeWidth: 1,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      );
    else
      return SizedBox(
        height: size,
        width: size,
        child: Padding(
          padding: (padding != null) ? EdgeInsets.all(padding!) : EdgeInsets.all(0),
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      );
  }
}
