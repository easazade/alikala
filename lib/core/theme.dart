import 'package:alikala/core/constants.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

/// in flutter 3.10.4 ThemeData.from() is the recommended method to theme our app
/// we should add a theme and a dark theme to app.
/// read code comments on ThemeData.from() method.
/// then we can use copyWith method to override the other theme like appBarTheme or button theme and so forth
ThemeData appTheme(Brightness brightness) {
  late ColorScheme colorScheme;

  if (brightness == Brightness.light) {
    colorScheme = ColorScheme.light(
      primary: AppColors.primary,
      //add values
    );
  } else {
    colorScheme = ColorScheme.dark(
        //add values

        );
  }

  return ThemeData.from(
    colorScheme: colorScheme,
    useMaterial3: true,
    textTheme: TextTheme().apply(
      fontFamily: FontFamily.opensans,
      bodyColor: AppColors.textDark,
      fontFamilyFallback: ['Roboto'],
      displayColor: AppColors.textDark, //default color of texts in app
    ),
  ).copyWith(
    // add overrides here
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.textDark,
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      //  iconTheme: base.iconTheme.copyWith(color: colorScheme.onPrimary),
      // actionsIconTheme: base.iconTheme.copyWith(color: colorScheme.onPrimary),
      // titleTextStyle: texts.h2SemiBold.copyWith(color: colorScheme.onPrimary),
      // toolbarTextStyle: texts.h2SemiBold.copyWith(color: colorScheme.onPrimary),
    ),
  );
}
