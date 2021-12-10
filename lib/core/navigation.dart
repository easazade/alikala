import 'package:alikala/features/address/address_page.dart';
import 'package:alikala/features/cart/cart_page.dart';
import 'package:alikala/features/categories/categories_page.dart';
import 'package:alikala/features/enter/pass/enter_password_page.dart';
import 'package:alikala/features/favorites/favorites_page.dart';
import 'package:alikala/features/home/home_page.dart';
import 'package:alikala/features/login/login_page.dart';
import 'package:alikala/features/product/product_page.dart';
import 'package:alikala/features/profile/profile_page.dart';
import 'package:alikala/features/search/search_page.dart';
import 'package:alikala/features/settings/settings_page.dart';
import 'package:alikala/features/splash/splash_screen.dart';
import 'package:alikala/features/verify/code/verify_code_page.dart';
import 'package:alikala/main_screen.dart';
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
