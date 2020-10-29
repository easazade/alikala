import 'package:alikala/core/constants.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:flutter/cupertino.dart';

class MaterialAppCupertinoThemeDataOverrides extends CupertinoThemeData {
  MaterialAppCupertinoThemeDataOverrides(String fontFamily) : super(
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

