import 'package:alikala/core/constants.dart';
import 'package:flutter/material.dart';

class AppFormLongButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  AppFormLongButton(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.THEME_ACCENT,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
