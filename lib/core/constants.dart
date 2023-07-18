import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFEF394F);
  static const themeAccent2 = Color(0xFF0FAAC6);
  static const themeAccent3 = Color(0xFF00B241);
  static const transparent = Color(0x00000000);
  static const orange = Color(0xFFF9A825);
  static const yellowStar = Color(0xFFF9BC01);
  static const textLight = Color(0xFFADB0C8);
  static const textLight2 = Color(0xFF6F7279);
  static const textLight3 = Color(0xFF81848A);
  static const textMed = Color(0xFF404040);
  static const textDark = Color(0xFF1D1D1D);
  static const hyperlink = Color(0xFF0FAAC6);
  static const greyDark = Color(0xFF6A6E7C);
  static const white = Color(0xFFFFFFFF);
}

class Routes {
  static const String main_screen = '/main_screen';
  static const String home = '/home';
  static const String categories = '/categories';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String verify_code = '/verify_code';
  static const String enter_pass = '/enter_pass';
  static const String must_login = '/must_login';
  static const String settings = '/settings';
  static const String splash = '/splash';
  static const String favorites_page = '/favorites_page';
  static const String search = '/search';
  static const String address = '/address';
  static const String product = '/product';
}

class TextStyles {
  static const dark_10 = TextStyle(fontSize: 10, color: AppColors.textDark);
  static const dark_12 = TextStyle(fontSize: 12, color: AppColors.textDark);
  static const dark_14 = TextStyle(fontSize: 14, color: AppColors.textDark);
  static const dark_16 = TextStyle(fontSize: 16, color: AppColors.textDark);
  static const dark_18 = TextStyle(fontSize: 18, color: AppColors.textDark);
  static const dark_20 = TextStyle(fontSize: 20, color: AppColors.textDark);

  static const dark_10_w500 = TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.textDark);
  static const dark_12_w500 = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textDark);
  static const dark_14_w500 = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textDark);
  static const dark_16_w500 = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textDark);
  static const dark_18_w500 = TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textDark);
  static const dark_20_w500 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.textDark);

  static const dark_10_w700 = TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static const dark_12_w700 = TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static const dark_14_w700 = TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static const dark_16_w700 = TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static const dark_18_w700 = TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static const dark_20_w700 = TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textDark);

  static const light_10 = TextStyle(fontSize: 10, color: AppColors.textLight2);
  static const light_12 = TextStyle(fontSize: 12, color: AppColors.textLight2);
  static const light_14 = TextStyle(fontSize: 14, color: AppColors.textLight2);
  static const light_16 = TextStyle(fontSize: 16, color: AppColors.textLight2);
  static const light_18 = TextStyle(fontSize: 18, color: AppColors.textLight2);
  static const light_20 = TextStyle(fontSize: 20, color: AppColors.textLight2);

  static const light_10_w500 = TextStyle(fontSize: 10, color: AppColors.textLight2, fontWeight: FontWeight.w500);
  static const light_12_w500 = TextStyle(fontSize: 12, color: AppColors.textLight2, fontWeight: FontWeight.w500);
  static const light_14_w500 = TextStyle(fontSize: 14, color: AppColors.textLight2, fontWeight: FontWeight.w500);
  static const light_16_w500 = TextStyle(fontSize: 16, color: AppColors.textLight2, fontWeight: FontWeight.w500);
  static const light_18_w500 = TextStyle(fontSize: 18, color: AppColors.textLight2, fontWeight: FontWeight.w500);
  static const light_20_w500 = TextStyle(fontSize: 20, color: AppColors.textLight2, fontWeight: FontWeight.w500);

  static const light_10_w700 = TextStyle(fontSize: 10, color: AppColors.textLight2, fontWeight: FontWeight.w700);
  static const light_12_w700 = TextStyle(fontSize: 12, color: AppColors.textLight2, fontWeight: FontWeight.w700);
  static const light_14_w700 = TextStyle(fontSize: 14, color: AppColors.textLight2, fontWeight: FontWeight.w700);
  static const light_16_w700 = TextStyle(fontSize: 16, color: AppColors.textLight2, fontWeight: FontWeight.w700);
  static const light_18_w700 = TextStyle(fontSize: 18, color: AppColors.textLight2, fontWeight: FontWeight.w700);
  static const light_20_w700 = TextStyle(fontSize: 20, color: AppColors.textLight2, fontWeight: FontWeight.w700);

  static const darkgrey_10 = TextStyle(fontSize: 10, color: AppColors.textMed);
  static const darkgrey_12 = TextStyle(fontSize: 12, color: AppColors.textMed);
  static const darkgrey_14 = TextStyle(fontSize: 14, color: AppColors.textMed);
  static const darkgrey_16 = TextStyle(fontSize: 16, color: AppColors.textMed);
  static const darkgrey_18 = TextStyle(fontSize: 18, color: AppColors.textMed);
  static const darkgrey_20 = TextStyle(fontSize: 20, color: AppColors.textMed);

  static const darkgrey_10_w500 = TextStyle(fontSize: 10, color: AppColors.textMed, fontWeight: FontWeight.w500);
  static const darkgrey_12_w500 = TextStyle(fontSize: 12, color: AppColors.textMed, fontWeight: FontWeight.w500);
  static const darkgrey_14_w500 = TextStyle(fontSize: 14, color: AppColors.textMed, fontWeight: FontWeight.w500);
  static const darkgrey_16_w500 = TextStyle(fontSize: 16, color: AppColors.textMed, fontWeight: FontWeight.w500);
  static const darkgrey_18_w500 = TextStyle(fontSize: 18, color: AppColors.textMed, fontWeight: FontWeight.w500);
  static const darkgrey_20_w500 = TextStyle(fontSize: 20, color: AppColors.textMed, fontWeight: FontWeight.w500);

  static const darkgrey_10_w700 = TextStyle(fontSize: 10, color: AppColors.textMed, fontWeight: FontWeight.w700);
  static const darkgrey_12_w700 = TextStyle(fontSize: 12, color: AppColors.textMed, fontWeight: FontWeight.w700);
  static const darkgrey_14_w700 = TextStyle(fontSize: 14, color: AppColors.textMed, fontWeight: FontWeight.w700);
  static const darkgrey_16_w700 = TextStyle(fontSize: 16, color: AppColors.textMed, fontWeight: FontWeight.w700);
  static const darkgrey_18_w700 = TextStyle(fontSize: 18, color: AppColors.textMed, fontWeight: FontWeight.w700);
  static const darkgrey_20_w700 = TextStyle(fontSize: 20, color: AppColors.textMed, fontWeight: FontWeight.w700);

  static const white_10 = TextStyle(fontSize: 10, color: Colors.white);
  static const white_12 = TextStyle(fontSize: 12, color: Colors.white);
  static const white_14 = TextStyle(fontSize: 14, color: Colors.white);
  static const white_16 = TextStyle(fontSize: 16, color: Colors.white);
  static const white_18 = TextStyle(fontSize: 18, color: Colors.white);
  static const white_20 = TextStyle(fontSize: 20, color: Colors.white);

  static const white_10_w500 = TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w500);
  static const white_12_w500 = TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500);
  static const white_14_w500 = TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500);
  static const white_16_w500 = TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500);
  static const white_18_w500 = TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500);
  static const white_20_w500 = TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500);

  static const white_10_w700 = TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w700);
  static const white_12_w700 = TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700);
  static const white_14_w700 = TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700);
  static const white_16_w700 = TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700);
  static const white_18_w700 = TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700);
  static const white_20_w700 = TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700);
}
