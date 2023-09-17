import 'package:flutter_crystalline/flutter_crystalline.dart';

class AppOperations {
  static const login = Operation('login');
  static const signup = Operation('signup');
  static const verify = Operation('verify');
  static const reloadingCart = Operation('reloading-cart');
}

class AppEvents {
  static const loggedIn = Event('logged-in');
  static const loggedOut = Event('logged-out');
  static const requestedSignUp = Event('sent-register-request');
}
