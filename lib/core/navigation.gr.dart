// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../data/entities.dart' as _i17;
import '../features/address/address_page.dart' as _i12;
import '../features/cart/cart_page.dart' as _i3;
import '../features/categories/categories_page.dart' as _i2;
import '../features/enter/pass/enter_password_page.dart' as _i7;
import '../features/favorites/favorites_page.dart' as _i14;
import '../features/home/home_page.dart' as _i1;
import '../features/login/login_page.dart' as _i8;
import '../features/product/product_page.dart' as _i13;
import '../features/profile/profile_page.dart' as _i4;
import '../features/search/search_page.dart' as _i11;
import '../features/settings/settings_page.dart' as _i9;
import '../features/splash/splash_screen.dart' as _i10;
import '../features/verify/code/verify_code_page.dart' as _i5;
import '../main_screen.dart' as _i6;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.CategoriesPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.CartPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProfilePage(),
      );
    },
    VerifyCodeRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.VerifyCodePage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.MainPage(),
      );
    },
    EnterPasswordRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.EnterPasswordPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.LoginPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.SplashPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.SearchPage(),
      );
    },
    AddressRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.AddressPage(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.ProductPage(args.product),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.FavoritesPage(),
      );
    },
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i15.RouteConfig(
          CategoriesRoute.name,
          path: '/categories-page',
        ),
        _i15.RouteConfig(
          CartRoute.name,
          path: '/cart-page',
        ),
        _i15.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i15.RouteConfig(
          VerifyCodeRoute.name,
          path: '/verify-code-page',
        ),
        _i15.RouteConfig(
          MainRoute.name,
          path: '/main-page',
        ),
        _i15.RouteConfig(
          EnterPasswordRoute.name,
          path: '/enter-password-page',
        ),
        _i15.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i15.RouteConfig(
          SettingsRoute.name,
          path: '/settings-page',
        ),
        _i15.RouteConfig(
          SplashRoute.name,
          path: '/splash-page',
        ),
        _i15.RouteConfig(
          SearchRoute.name,
          path: '/search-page',
        ),
        _i15.RouteConfig(
          AddressRoute.name,
          path: '/address-page',
        ),
        _i15.RouteConfig(
          ProductRoute.name,
          path: '/product-page',
        ),
        _i15.RouteConfig(
          FavoritesRoute.name,
          path: '/favorites-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CategoriesPage]
class CategoriesRoute extends _i15.PageRouteInfo<void> {
  const CategoriesRoute()
      : super(
          CategoriesRoute.name,
          path: '/categories-page',
        );

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i3.CartPage]
class CartRoute extends _i15.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart-page',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.VerifyCodePage]
class VerifyCodeRoute extends _i15.PageRouteInfo<void> {
  const VerifyCodeRoute()
      : super(
          VerifyCodeRoute.name,
          path: '/verify-code-page',
        );

  static const String name = 'VerifyCodeRoute';
}

/// generated route for
/// [_i6.MainPage]
class MainRoute extends _i15.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main-page',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i7.EnterPasswordPage]
class EnterPasswordRoute extends _i15.PageRouteInfo<void> {
  const EnterPasswordRoute()
      : super(
          EnterPasswordRoute.name,
          path: '/enter-password-page',
        );

  static const String name = 'EnterPasswordRoute';
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings-page',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i10.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash-page',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i11.SearchPage]
class SearchRoute extends _i15.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '/search-page',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i12.AddressPage]
class AddressRoute extends _i15.PageRouteInfo<void> {
  const AddressRoute()
      : super(
          AddressRoute.name,
          path: '/address-page',
        );

  static const String name = 'AddressRoute';
}

/// generated route for
/// [_i13.ProductPage]
class ProductRoute extends _i15.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({required _i17.Product product})
      : super(
          ProductRoute.name,
          path: '/product-page',
          args: ProductRouteArgs(product: product),
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({required this.product});

  final _i17.Product product;

  @override
  String toString() {
    return 'ProductRouteArgs{product: $product}';
  }
}

/// generated route for
/// [_i14.FavoritesPage]
class FavoritesRoute extends _i15.PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: '/favorites-page',
        );

  static const String name = 'FavoritesRoute';
}
