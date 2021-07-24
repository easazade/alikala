import 'package:alikala/core/constants.dart';
import 'package:alikala/widgets/app_form_long_btn.dart';
import 'package:alikala/widgets/util/unfocus_current_focus_widget.dart';
import 'package:alikala/widgets/util/verification_code_input.dart';
import 'package:flutter/material.dart';

class VerifyCodePage extends StatelessWidget {
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
              _createCodeInputArea(context),
              SizedBox(height: 120),
              Column(
                children: [
                  Text('ارسال مجدد کد تا 180 ثانیه دیگر', style: TextStyle(fontSize: 12, color: AppColors.TEXT_MED)),
                  SizedBox(height: 15),
                  AppFormLongButton('تایید', () {}, disabled: true),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _createCodeInputArea(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text('کد تایید را وارد نمایید', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        SizedBox(height: 6),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'کد تایید برای شماره موبایل 989117158746 ارسال گردید',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 40),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.GREY_BG,
              borderRadius: BorderRadius.circular(8),
            ),
            child: VerificationCodeInput(
              length: 5,
              onCompleted: (completedInput) {},
              itemDecoration: BoxDecoration(),
              itemSize: 50,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
