import 'package:alikala/core/constants.dart';
import 'package:flutter/material.dart';

class AppFormLongButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool disabled;

  const AppFormLongButton(this.label, this.onTap, {this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        splashColor: disabled ? AppColors.TRANSPARENT : Colors.white.withOpacity(0.3),
        child: Ink(
          height: 54,
          decoration: BoxDecoration(
            color: disabled ? Colors.white : AppColors.THEME_ACCENT,
            borderRadius: BorderRadius.circular(8),
            border: disabled ? Border.all(color: Colors.grey[100]!) : null,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  color: disabled ? AppColors.TEXT_LIGHT : Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
