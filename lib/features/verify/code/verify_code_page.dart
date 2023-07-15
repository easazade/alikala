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
                  Text('Send Again in 180 seconds', style: TextStyle(fontSize: 12, color: AppColors.TEXT_MED)),
                  SizedBox(height: 15),
                  AppFormLongButton('Verify', () {}, disabled: true),
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
          child: Text('Enter verification code', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        SizedBox(height: 6),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'Enter verification code for +989785559909',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 40),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.BG,
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
