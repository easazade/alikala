import 'package:alikala/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialAppCupertinoThemeDataOverrides extends CupertinoThemeData {
  MaterialAppCupertinoThemeDataOverrides(String fontFamily)
      : super(
          brightness: Brightness.light,
          primaryColor: AppColors.THEME_ACCENT,
          primaryContrastingColor: AppColors.THEME_ACCENT_2,
          scaffoldBackgroundColor: Colors.white,
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(color: AppColors.TEXT_DARK, fontFamily: fontFamily),
            actionTextStyle: TextStyle(color: AppColors.TEXT_DARK, fontFamily: fontFamily),
            dateTimePickerTextStyle: TextStyle(color: AppColors.TEXT_DARK, fontFamily: fontFamily),
            navActionTextStyle: TextStyle(color: AppColors.TEXT_DARK, fontFamily: fontFamily),
            navLargeTitleTextStyle: TextStyle(color: AppColors.TEXT_DARK, fontFamily: fontFamily),
            navTitleTextStyle: TextStyle(color: AppColors.TEXT_DARK, fontFamily: fontFamily),
            pickerTextStyle: TextStyle(color: AppColors.TEXT_DARK, fontFamily: fontFamily),
            tabLabelTextStyle: TextStyle(color: AppColors.TEXT_DARK, fontFamily: fontFamily, fontSize: 11),
          ),
        );
}
