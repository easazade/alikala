import 'package:application/core/constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool disabled;

  const AppButton(this.label, this.onTap, {this.disabled = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      child: InkWell(
        onTap: onTap,
        splashColor: disabled ? AppColors.transparent : Colors.white.withOpacity(0.3),
        child: Ink(
          height: 54,
          decoration: BoxDecoration(
            color: disabled ? Colors.white : theme.primaryColor,
            borderRadius: BorderRadius.circular(8),
            border: disabled ? Border.all(color: Colors.grey[100]!) : null,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: disabled ? AppColors.textLight : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
