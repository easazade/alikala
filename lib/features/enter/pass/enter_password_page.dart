import 'package:alikala/core/constants.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:alikala/widgets/app_form_field.dart';
import 'package:alikala/widgets/app_form_long_btn.dart';
import 'package:alikala/widgets/util/unfocus_current_focus_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RemoveFocusOnTouchOutsideFocusedWidget(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.TRANSPARENT,
          shadowColor: AppColors.TRANSPARENT,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              _createPasswordInputArea(context),
              SizedBox(height: 120),
              AppFormLongButton('تایید', () {}),
            ],
          ),
        ),
      ),
    );
  }

  _createPasswordInputArea(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text('رمز عبور', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        SizedBox(height: 6),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'رمز عبور مربوط به حساب کابری خود را وارد کنید. '
            'easazade@gmail.com',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 20),
        Directionality(
          textDirection: TextDirection.ltr,
          child: AppFormField('رمز عبور', (pass) {},
              keyboardType: TextInputType.visiblePassword, fontFamily: FontFamily.estedad),
        ),
        SizedBox(height: 20),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text('بازیابی رمز عبور',
                    style: TextStyle(color: AppColors.THEME_ACCENT_2, fontSize: 12, fontWeight: FontWeight.w500)),
                Icon(CupertinoIcons.forward, size: 12, color: AppColors.THEME_ACCENT_2),
              ],
            ),
          ),
        )
      ],
    );
  }
}
