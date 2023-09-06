import 'package:application/core/constants.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/widgets/app_form_long_btn.dart';
import 'package:application/widgets/util/unfocus_current_focus_widget.dart';
import 'package:application/widgets/util/verification_code_input.dart';
import 'package:flutter/material.dart';

class VerifyCodePage extends StatelessWidget {
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
              _createCodeInputArea(context),
              SizedBox(height: 120),
              Column(
                children: [
                  Text(S.of(context).sendAgainInNSeconds(180),
                      style: TextStyle(fontSize: 12, color: AppColors.textMed)),
                  SizedBox(height: 15),
                  AppFormLongButton(S.of(context).verify, () {}, disabled: true),
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
          child: Text(S.of(context).enterVerificationCode, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        SizedBox(height: 6),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            '${S.of(context).enterVerificationCodeFor} +989785559909',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 40),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
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
