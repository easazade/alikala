import 'package:application/features/address/address_page.dart';
import 'package:application/features/cart/cart_page.dart';
import 'package:application/features/categories/categories_page.dart';
import 'package:application/features/enter/pass/enter_password_page.dart';
import 'package:application/features/favorites/favorites_page.dart';
import 'package:application/features/home/home_page.dart';
import 'package:application/features/login/login_page.dart';
import 'package:application/features/product/product_page.dart';
import 'package:application/features/profile/profile_page.dart';
import 'package:application/features/search/search_page.dart';
import 'package:application/features/settings/settings_page.dart';
import 'package:application/features/splash/splash_screen.dart';
import 'package:application/features/verify/code/verify_code_page.dart';
import 'package:application/main_screen.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage),
    AutoRoute(page: CategoriesPage),
    AutoRoute(page: CartPage),
    AutoRoute(page: ProfilePage),
    AutoRoute(page: VerifyCodePage),
    AutoRoute(page: MainPage),
    AutoRoute(page: EnterPasswordPage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: SplashPage),
    AutoRoute(page: SearchPage),
    AutoRoute(page: AddressPage),
    AutoRoute(page: ProductPage),
    AutoRoute(page: FavoritesPage),
  ],
)
class $AppRouter {}
