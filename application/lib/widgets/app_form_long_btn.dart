import 'package:application/core/constants.dart';
import 'package:flutter/material.dart';

class AppLongButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool disabled;
  final bool loading;

  const AppLongButton(
    this.label,
    this.onTap, {
    this.disabled = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      child: InkWell(
        onTap: (disabled || loading) ? null : onTap,
        splashColor: disabled ? AppColors.transparent : Colors.white.withOpacity(0.3),
        child: Ink(
          height: 54,
          decoration: BoxDecoration(
            color: disabled ? Colors.white : theme.primaryColor,
            borderRadius: BorderRadius.circular(8),
            border: disabled ? Border.all(color: Color.fromARGB(255, 19, 13, 13)) : null,
          ),
          child: Center(
            child: loading
                ? SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.onPrimary,
                      strokeWidth: 3,
                    ),
                  )
                : Text(
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
