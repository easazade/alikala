import 'package:alikala/features/address/address_page.dart';
import 'package:alikala/features/cart/cart_page.dart';
import 'package:alikala/features/categories/categories_page.dart';
import 'package:alikala/features/enter/pass/enter_password_page.dart';
import 'package:alikala/features/favorites/favorites_page.dart';
import 'package:alikala/features/home/home_page.dart';
import 'package:alikala/features/must/login/must_login_page.dart';
import 'package:alikala/features/product/product_page.dart';
import 'package:alikala/features/profile/profile_page.dart';
import 'package:alikala/features/search/search_page.dart';
import 'package:alikala/features/settings/settings_page.dart';
import 'package:alikala/features/splash/splash_screen.dart';
import 'package:alikala/features/veridy/code/verify_code_page.dart';
import 'package:alikala/main_screen.dart';
import 'package:mockito/mockito.dart' as mockito;
import 'package:mockito/mockito.dart';
import 'package:sailor/sailor.dart';

import 'constants.dart';

///global instance object of the Sailor class created for this app
///this object provides all solution for navigation purposes like defining page routes
///navigating to different pages
Sailor sailor;

/// mock version of the sailor class used only for testing purposes
class MockSailor extends Mock implements Sailor {
  static verifyPushAndRemove(String routeName) {
    mockito
        .verify(
          sailor.navigate(
            routeName,
            args: mockito.anyNamed('args'),
            navigationType: mockito.anyNamed('navigationType'),
            removeUntilPredicate: mockito.anyNamed('removeUntilPredicate'),
          ),
        )
        .called(1);
  }

  MockSailor() {
//    mockito.when(this.navigate(mockito.any)).thenAnswer((_) => Future.value());
//    mockito
//        .when(this.pushAndRemoveUntilRoute(mockito.any, mockito.any,
//            arg: mockito.anyNamed('arg')))
//        .thenAnswer((_) => Future.value());
  }
}

class NavigationConfig {
  ///defining all the routes to all pages
  ///defining a page routes adds a solution to navigate to that page later
  ///this method must be called once during app initialization
  static void createRoutes() {
    sailor.addRoutes(
      <SailorRoute>[
        SailorRoute(name: Routes.home, builder: (context, arg, params) => HomePage()),
        SailorRoute(name: Routes.categories, builder: (context, arg, params) => CategoriesPage()),
        SailorRoute(name: Routes.cart, builder: (context, arg, params) => CartPage()),
        SailorRoute(name: Routes.profile, builder: (context, arg, params) => ProfilePage()),
        SailorRoute(name: Routes.verify_code, builder: (context, arg, params) => VerifyCodePage()),
        SailorRoute(name: Routes.main_screen, builder: (context, arg, params) => MainScreen()),
        SailorRoute(name: Routes.enter_pass, builder: (context, arg, params) => EnterPasswordPage()),
        SailorRoute(name: Routes.must_login, builder: (context, arg, params) => MustLoginPage()),
        SailorRoute(name: Routes.settings, builder: (context, arg, params) => SettingsPage()),
        SailorRoute(name: Routes.splash, builder: (context, arg, params) => SplashScreen()),
        SailorRoute(name: Routes.search, builder: (context, arg, params) => SearchPage()),
        SailorRoute(name: Routes.address, builder: (context, arg, params) => AddressPage()),
        SailorRoute(name: Routes.product, builder: (context, arg, params) => ProductPage(arg)),
        SailorRoute(name: Routes.favorites_page, builder: (context, arg, params) => FavoritesPage()),
      ],
    );
  }
}
