import 'package:flutter/material.dart';

class AppColors {
  static const THEME_ACCENT = Color(0xFFEF394F);
  static const TRANSPARENT = Color(0x00000000);

  static const THEME_ORANGE = Color(0xFFF9A825);
  static const YELLOW_STAR = Color(0xFFF9BC01);

  static const TEXT_LIGHT = Color(0xFFADB0C8);
  static const TEXT_LIGHT_2 = Color(0xFF6F7279);
  static const TEXT_LIGHT_3 = Color(0xFF81848A);
  static const TEXT_MED = Color(0xFF404040);
  static const TEXT_DARK = Color(0xFF1D1D1D);

  static const THEME_ACCENT_2 = Color(0xFF0FAAC6);
  static const HYPER_LINK = Color(0xFF0FAAC6);

  static const GREY_BG = Color(0xFFECEDEF);
  static const GREY_DARK = Color(0xFF6A6E7C);

  static const THEME_ACCENT_3 = Color(0xFF00B241);
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
  static const dark_10 = const TextStyle(fontSize: 10, color: AppColors.TEXT_DARK);
  static const dark_12 = const TextStyle(fontSize: 12, color: AppColors.TEXT_DARK);
  static const dark_14 = const TextStyle(fontSize: 14, color: AppColors.TEXT_DARK);
  static const dark_16 = const TextStyle(fontSize: 16, color: AppColors.TEXT_DARK);
  static const dark_18 = const TextStyle(fontSize: 18, color: AppColors.TEXT_DARK);
  static const dark_20 = const TextStyle(fontSize: 20, color: AppColors.TEXT_DARK);

  static const dark_10_w500 = const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.TEXT_DARK);
  static const dark_12_w500 = const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.TEXT_DARK);
  static const dark_14_w500 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.TEXT_DARK);
  static const dark_16_w500 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.TEXT_DARK);
  static const dark_18_w500 = const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.TEXT_DARK);
  static const dark_20_w500 = const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.TEXT_DARK);

  static const dark_10_w700 = const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.TEXT_DARK);
  static const dark_12_w700 = const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.TEXT_DARK);
  static const dark_14_w700 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.TEXT_DARK);
  static const dark_16_w700 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.TEXT_DARK);
  static const dark_18_w700 = const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.TEXT_DARK);
  static const dark_20_w700 = const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.TEXT_DARK);

  static const light_10 = const TextStyle(fontSize: 10, color: AppColors.TEXT_LIGHT_2);
  static const light_12 = const TextStyle(fontSize: 12, color: AppColors.TEXT_LIGHT_2);
  static const light_14 = const TextStyle(fontSize: 14, color: AppColors.TEXT_LIGHT_2);
  static const light_16 = const TextStyle(fontSize: 16, color: AppColors.TEXT_LIGHT_2);
  static const light_18 = const TextStyle(fontSize: 18, color: AppColors.TEXT_LIGHT_2);
  static const light_20 = const TextStyle(fontSize: 20, color: AppColors.TEXT_LIGHT_2);

  static const light_10_w500 = const TextStyle(fontSize: 10, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w500);
  static const light_12_w500 = const TextStyle(fontSize: 12, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w500);
  static const light_14_w500 = const TextStyle(fontSize: 14, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w500);
  static const light_16_w500 = const TextStyle(fontSize: 16, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w500);
  static const light_18_w500 = const TextStyle(fontSize: 18, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w500);
  static const light_20_w500 = const TextStyle(fontSize: 20, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w500);

  static const light_10_w700 = const TextStyle(fontSize: 10, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w700);
  static const light_12_w700 = const TextStyle(fontSize: 12, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w700);
  static const light_14_w700 = const TextStyle(fontSize: 14, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w700);
  static const light_16_w700 = const TextStyle(fontSize: 16, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w700);
  static const light_18_w700 = const TextStyle(fontSize: 18, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w700);
  static const light_20_w700 = const TextStyle(fontSize: 20, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w700);

  static const darkgrey_10 = const TextStyle(fontSize: 10, color: AppColors.TEXT_MED);
  static const darkgrey_12 = const TextStyle(fontSize: 12, color: AppColors.TEXT_MED);
  static const darkgrey_14 = const TextStyle(fontSize: 14, color: AppColors.TEXT_MED);
  static const darkgrey_16 = const TextStyle(fontSize: 16, color: AppColors.TEXT_MED);
  static const darkgrey_18 = const TextStyle(fontSize: 18, color: AppColors.TEXT_MED);
  static const darkgrey_20 = const TextStyle(fontSize: 20, color: AppColors.TEXT_MED);

  static const darkgrey_10_w500 = const TextStyle(fontSize: 10, color: AppColors.TEXT_MED, fontWeight: FontWeight.w500);
  static const darkgrey_12_w500 = const TextStyle(fontSize: 12, color: AppColors.TEXT_MED, fontWeight: FontWeight.w500);
  static const darkgrey_14_w500 = const TextStyle(fontSize: 14, color: AppColors.TEXT_MED, fontWeight: FontWeight.w500);
  static const darkgrey_16_w500 = const TextStyle(fontSize: 16, color: AppColors.TEXT_MED, fontWeight: FontWeight.w500);
  static const darkgrey_18_w500 = const TextStyle(fontSize: 18, color: AppColors.TEXT_MED, fontWeight: FontWeight.w500);
  static const darkgrey_20_w500 = const TextStyle(fontSize: 20, color: AppColors.TEXT_MED, fontWeight: FontWeight.w500);

  static const darkgrey_10_w700 = const TextStyle(fontSize: 10, color: AppColors.TEXT_MED, fontWeight: FontWeight.w700);
  static const darkgrey_12_w700 = const TextStyle(fontSize: 12, color: AppColors.TEXT_MED, fontWeight: FontWeight.w700);
  static const darkgrey_14_w700 = const TextStyle(fontSize: 14, color: AppColors.TEXT_MED, fontWeight: FontWeight.w700);
  static const darkgrey_16_w700 = const TextStyle(fontSize: 16, color: AppColors.TEXT_MED, fontWeight: FontWeight.w700);
  static const darkgrey_18_w700 = const TextStyle(fontSize: 18, color: AppColors.TEXT_MED, fontWeight: FontWeight.w700);
  static const darkgrey_20_w700 = const TextStyle(fontSize: 20, color: AppColors.TEXT_MED, fontWeight: FontWeight.w700);

  static const white_10 = const TextStyle(fontSize: 10, color: Colors.white);
  static const white_12 = const TextStyle(fontSize: 12, color: Colors.white);
  static const white_14 = const TextStyle(fontSize: 14, color: Colors.white);
  static const white_16 = const TextStyle(fontSize: 16, color: Colors.white);
  static const white_18 = const TextStyle(fontSize: 18, color: Colors.white);
  static const white_20 = const TextStyle(fontSize: 20, color: Colors.white);

  static const white_10_w500 = const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w500);
  static const white_12_w500 = const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500);
  static const white_14_w500 = const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500);
  static const white_16_w500 = const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500);
  static const white_18_w500 = const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500);
  static const white_20_w500 = const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500);

  static const white_10_w700 = const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w700);
  static const white_12_w700 = const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700);
  static const white_14_w700 = const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700);
  static const white_16_w700 = const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700);
  static const white_18_w700 = const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700);
  static const white_20_w700 = const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700);
}
