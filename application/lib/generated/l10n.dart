// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `AliKala`
  String get app_name {
    return Intl.message(
      'AliKala',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Search In`
  String get searchIn {
    return Intl.message(
      'Search In',
      name: 'searchIn',
      desc: '',
      args: [],
    );
  }

  /// `Add new Address`
  String get addNewAddress {
    return Intl.message(
      'Add new Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Edit Address`
  String get editAddress {
    return Intl.message(
      'Edit Address',
      name: 'editAddress',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shoppingCart {
    return Intl.message(
      'Shopping Cart',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `Login or Sign up`
  String get loginOrSignUp {
    return Intl.message(
      'Login or Sign up',
      name: 'loginOrSignUp',
      desc: '',
      args: [],
    );
  }

  /// `For a better experience in Our Shop please Login`
  String get forABetterExperienceInOurShopPleaseLogin {
    return Intl.message(
      'For a better experience in Our Shop please Login',
      name: 'forABetterExperienceInOurShopPleaseLogin',
      desc: '',
      args: [],
    );
  }

  /// `You\'re shopping cart is empty`
  String get youreShoppingCartIsEmpty {
    return Intl.message(
      'You\\\'re shopping cart is empty',
      name: 'youreShoppingCartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Sum`
  String get sum {
    return Intl.message(
      'Sum',
      name: 'sum',
      desc: '',
      args: [],
    );
  }

  /// `Continue Browsing`
  String get continueBrowsing {
    return Intl.message(
      'Continue Browsing',
      name: 'continueBrowsing',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter password for your account`
  String get pleaseEnterPasswordForYourAccount {
    return Intl.message(
      'Please Enter password for your account',
      name: 'pleaseEnterPasswordForYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Recover your password`
  String get recoverYourPassword {
    return Intl.message(
      'Recover your password',
      name: 'recoverYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Your favorite items`
  String get yourFavoriteItems {
    return Intl.message(
      'Your favorite items',
      name: 'yourFavoriteItems',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get items {
    return Intl.message(
      'items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Most liked by customers`
  String get mostLikedByCustomers {
    return Intl.message(
      'Most liked by customers',
      name: 'mostLikedByCustomers',
      desc: '',
      args: [],
    );
  }

  /// `Things you might like`
  String get thingsYouMightLike {
    return Intl.message(
      'Things you might like',
      name: 'thingsYouMightLike',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Top Sales`
  String get topSales {
    return Intl.message(
      'Top Sales',
      name: 'topSales',
      desc: '',
      args: [],
    );
  }

  /// `New Items`
  String get newItems {
    return Intl.message(
      'New Items',
      name: 'newItems',
      desc: '',
      args: [],
    );
  }

  /// `AliKala`
  String get alikala {
    return Intl.message(
      'AliKala',
      name: 'alikala',
      desc: '',
      args: [],
    );
  }

  /// `To Login you need to enter email or mobile number`
  String get toLoginYouNeedToEnterEmailOrMobileNumber {
    return Intl.message(
      'To Login you need to enter email or mobile number',
      name: 'toLoginYouNeedToEnterEmailOrMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number or email`
  String get phoneNumberOrEmail {
    return Intl.message(
      'Phone number or email',
      name: 'phoneNumberOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Log in to AliKala`
  String get logInToAlikala {
    return Intl.message(
      'Log in to AliKala',
      name: 'logInToAlikala',
      desc: '',
      args: [],
    );
  }

  /// `By loging in to AliKala`
  String get byLogingInToAlikala {
    return Intl.message(
      'By loging in to AliKala',
      name: 'byLogingInToAlikala',
      desc: '',
      args: [],
    );
  }

  /// `Rules And Agreements`
  String get rulesAndAgreements {
    return Intl.message(
      'Rules And Agreements',
      name: 'rulesAndAgreements',
      desc: '',
      args: [],
    );
  }

  /// `Using AliKala Services`
  String get usingAlikalaServices {
    return Intl.message(
      'Using AliKala Services',
      name: 'usingAlikalaServices',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Accept it`
  String get acceptIt {
    return Intl.message(
      'Accept it',
      name: 'acceptIt',
      desc: '',
      args: [],
    );
  }

  /// `Similar Items`
  String get similarItems {
    return Intl.message(
      'Similar Items',
      name: 'similarItems',
      desc: '',
      args: [],
    );
  }

  /// `Buyers Comments`
  String get buyersComments {
    return Intl.message(
      'Buyers Comments',
      name: 'buyersComments',
      desc: '',
      args: [],
    );
  }

  /// `Acout Product`
  String get acoutProduct {
    return Intl.message(
      'Acout Product',
      name: 'acoutProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `points`
  String get points {
    return Intl.message(
      'points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Favorites List`
  String get favoritesList {
    return Intl.message(
      'Favorites List',
      name: 'favoritesList',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get addresses {
    return Intl.message(
      'Addresses',
      name: 'addresses',
      desc: '',
      args: [],
    );
  }

  /// `Account Details`
  String get accountDetails {
    return Intl.message(
      'Account Details',
      name: 'accountDetails',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `Call Us`
  String get callUs {
    return Intl.message(
      'Call Us',
      name: 'callUs',
      desc: '',
      args: [],
    );
  }

  /// `Rate AliKala app`
  String get rateAlikalaApp {
    return Intl.message(
      'Rate AliKala app',
      name: 'rateAlikalaApp',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get appVersion {
    return Intl.message(
      'App Version',
      name: 'appVersion',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, zero{Press to send again} one{Send Again in 1 second} other{Send Again in {count} seconds}}`
  String sendAgainInNSeconds(num count) {
    return Intl.plural(
      count,
      zero: 'Press to send again',
      one: 'Send Again in 1 second',
      other: 'Send Again in $count seconds',
      name: 'sendAgainInNSeconds',
      desc: 'send code again text in verify code page',
      args: [count],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter verification code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code for`
  String get enterVerificationCodeFor {
    return Intl.message(
      'Enter verification code for',
      name: 'enterVerificationCodeFor',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Could not Find anything`
  String get couldNotFindAnything {
    return Intl.message(
      'Could not Find anything',
      name: 'couldNotFindAnything',
      desc: '',
      args: [],
    );
  }

  /// `color`
  String get color {
    return Intl.message(
      'color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter a password`
  String get enterAPassword {
    return Intl.message(
      'Enter a password',
      name: 'enterAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm a password`
  String get confirmAPassword {
    return Intl.message(
      'Confirm a password',
      name: 'confirmAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
