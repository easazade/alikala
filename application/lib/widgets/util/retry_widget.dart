import 'package:application/core/constants.dart';
import 'package:application/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class RetryWidget extends StatelessWidget {
  final Function action;

  const RetryWidget(this.action);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: Container(
        height: 42,
        width: 42,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.transparent,
          border: Border.all(color: AppColors.greyDark),
        ),
        child: Center(
          child: Image.asset(Assets.images.retry.path, width: 42, height: 42),
        ),
      ),
    );
  }
}
