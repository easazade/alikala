import 'package:alikala/core/constants.dart';
import 'package:flutter/material.dart';

class ActionErrorWidget extends StatelessWidget {
  final String msg;
  final String? actionText;
  final VoidCallback action;
  final IconData? icon;

  const ActionErrorWidget(this.msg, this.action, {this.actionText, this.icon});

  @override
  Widget build(BuildContext context) {
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
              Icon(icon, color: AppColors.THEME_ACCENT, size: 70),
              SizedBox(height: 10),
            ],
            Text(msg, style: TextStyle(color: AppColors.TEXT_DARK, fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 10),
//            AppButton(text: actionText ?? 'دوباره تلاش کنید', onClick: action, color: AppColors.ACCENT_GREEN),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: action,
              child: Text(actionText ?? 'دوباره تلاش کنید'),
              color: AppColors.THEME_ACCENT,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
