// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../data/entities.dart' as _i17;
import '../features/address/address_page.dart' as _i14;
import '../features/cart/cart_page.dart' as _i5;
import '../features/categories/categories_page.dart' as _i4;
import '../features/enter/pass/enter_password_page.dart' as _i9;
import '../features/favorites/favorites_page.dart' as _i16;
import '../features/home/home_page.dart' as _i3;
import '../features/login/login_page.dart' as _i10;
import '../features/product/product_page.dart' as _i15;
import '../features/profile/profile_page.dart' as _i6;
import '../features/search/search_page.dart' as _i13;
import '../features/settings/settings_page.dart' as _i11;
import '../features/splash/splash_screen.dart' as _i12;
import '../features/verify/code/verify_code_page.dart' as _i7;
import '../main_screen.dart' as _i8;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.HomePage();
        }),
    CategoriesRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.CategoriesPage();
        }),
    CartRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.CartPage();
        }),
    ProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.ProfilePage();
        }),
    VerifyCodeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.VerifyCodePage();
        }),
    MainRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.MainPage();
        }),
    EnterPasswordRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.EnterPasswordPage();
        }),
    LoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i10.LoginPage();
        }),
    SettingsRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.SettingsPage();
        }),
    SplashRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.SplashPage();
        }),
    SearchRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i13.SearchPage();
        }),
    AddressRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i14.AddressPage();
        }),
    ProductRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ProductRouteArgs>();
          return _i15.ProductPage(args.product);
        }),
    FavoritesRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i16.FavoritesPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i1.RouteConfig(CategoriesRoute.name, path: '/categories-page'),
        _i1.RouteConfig(CartRoute.name, path: '/cart-page'),
        _i1.RouteConfig(ProfileRoute.name, path: '/profile-page'),
        _i1.RouteConfig(VerifyCodeRoute.name, path: '/verify-code-page'),
        _i1.RouteConfig(MainRoute.name, path: '/main-page'),
        _i1.RouteConfig(EnterPasswordRoute.name, path: '/enter-password-page'),
        _i1.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i1.RouteConfig(SettingsRoute.name, path: '/settings-page'),
        _i1.RouteConfig(SplashRoute.name, path: '/splash-page'),
        _i1.RouteConfig(SearchRoute.name, path: '/search-page'),
        _i1.RouteConfig(AddressRoute.name, path: '/address-page'),
        _i1.RouteConfig(ProductRoute.name, path: '/product-page'),
        _i1.RouteConfig(FavoritesRoute.name, path: '/favorites-page')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

class CategoriesRoute extends _i1.PageRouteInfo {
  const CategoriesRoute() : super(name, path: '/categories-page');

  static const String name = 'CategoriesRoute';
}

class CartRoute extends _i1.PageRouteInfo {
  const CartRoute() : super(name, path: '/cart-page');

  static const String name = 'CartRoute';
}

class ProfileRoute extends _i1.PageRouteInfo {
  const ProfileRoute() : super(name, path: '/profile-page');

  static const String name = 'ProfileRoute';
}

class VerifyCodeRoute extends _i1.PageRouteInfo {
  const VerifyCodeRoute() : super(name, path: '/verify-code-page');

  static const String name = 'VerifyCodeRoute';
}

class MainRoute extends _i1.PageRouteInfo {
  const MainRoute() : super(name, path: '/main-page');

  static const String name = 'MainRoute';
}

class EnterPasswordRoute extends _i1.PageRouteInfo {
  const EnterPasswordRoute() : super(name, path: '/enter-password-page');

  static const String name = 'EnterPasswordRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

class SettingsRoute extends _i1.PageRouteInfo {
  const SettingsRoute() : super(name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/splash-page');

  static const String name = 'SplashRoute';
}

class SearchRoute extends _i1.PageRouteInfo {
  const SearchRoute() : super(name, path: '/search-page');

  static const String name = 'SearchRoute';
}

class AddressRoute extends _i1.PageRouteInfo {
  const AddressRoute() : super(name, path: '/address-page');

  static const String name = 'AddressRoute';
}

class ProductRoute extends _i1.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({required _i17.Product product})
      : super(name,
            path: '/product-page', args: ProductRouteArgs(product: product));

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({required this.product});

  final _i17.Product product;
}

class FavoritesRoute extends _i1.PageRouteInfo {
  const FavoritesRoute() : super(name, path: '/favorites-page');

  static const String name = 'FavoritesRoute';
}
