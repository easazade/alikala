import 'package:alikala/core/constants.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:flutter/material.dart';

class VerifyCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.TRANSPARENT,
        shadowColor: AppColors.TRANSPARENT,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Align(
              alignment: AlignmentExt.centerStart(context),
              child: Text('کد تایید را وارد نمایید', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 6),
            Align(
              alignment: AlignmentExt.centerStart(context),
              child: Text(
                'کد تایید برای شماره موبایل 989117158746 ارسال گردید',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
