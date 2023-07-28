import 'dart:io';

import 'package:alikala/core/constants.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// in flutter 3.10.4 ThemeData.from() is the recommended method to theme our app
/// we should add a theme and a dark theme to app.
/// read code comments on ThemeData.from() method.
/// then we can use copyWith method to override the other theme like appBarTheme or button theme and so forth
ThemeData appTheme(Brightness brightness) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    brightness: brightness,
  );

  return ThemeData.from(
    colorScheme: colorScheme,
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, height: 1),
      titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1),
      titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, height: 1),
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ).apply(
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
      centerTitle: !kIsWeb && Platform.isIOS,
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      applyThemeToAll: true,
      barBackgroundColor: colorScheme.background,
      brightness: brightness,
      primaryColor: AppColors.primary,
    ),
  );
}
