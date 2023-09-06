import 'package:application/core/constants.dart';
import 'package:application/gen/fonts.gen.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/widgets/app_form_field.dart';
import 'package:application/widgets/app_form_long_btn.dart';
import 'package:application/widgets/util/unfocus_current_focus_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          shadowColor: AppColors.transparent,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              _createPasswordInputArea(context),
              SizedBox(height: 120),
              AppFormLongButton(S.of(context).accept, () {}),
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
          child: Text(S.of(context).password, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        SizedBox(height: 6),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            '${S.of(context).pleaseEnterPasswordForYourAccount} easazade@gmail.com',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 20),
        Directionality(
          textDirection: TextDirection.ltr,
          child: AppFormField(S.of(context).password, (pass) {},
              keyboardType: TextInputType.visiblePassword, fontFamily: FontFamily.opensans),
        ),
        SizedBox(height: 20),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(S.of(context).recoverYourPassword,
                    style: TextStyle(color: AppColors.themeAccent2, fontSize: 12, fontWeight: FontWeight.w500)),
                Icon(CupertinoIcons.forward, size: 12, color: AppColors.themeAccent2),
              ],
            ),
          ),
        )
      ],
    );
  }
}
