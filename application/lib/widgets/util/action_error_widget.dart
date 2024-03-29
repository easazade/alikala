import 'package:application/core/constants.dart';
import 'package:application/generated/l10n.dart';
import 'package:flutter/material.dart';

class ActionErrorWidget extends StatelessWidget {
  final String msg;
  final String? actionText;
  final VoidCallback action;
  final IconData? icon;

  const ActionErrorWidget(this.msg, this.action, {this.actionText, this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
//          border: Border.all(color: AppColors.ACCENT_GREEN_BTN),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (icon != null) ...[
              Icon(icon, color: theme.colorScheme.error, size: 70),
              SizedBox(height: 10),
            ],
            Text(msg, style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 10),
//            AppButton(text: actionText ?? 'Try Again', onClick: action, color: AppColors.ACCENT_GREEN),
            // ignore: deprecated_member_use

            TextButton(
              onPressed: action,
              child: Text(actionText ?? S.of(context).tryAgain),
              // color: AppColors.THEME_ACCENT,
              // textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
