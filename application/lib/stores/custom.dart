import 'package:flutter_crystalline/flutter_crystalline.dart';

class AppOperations {
  static const login = Operation('login');
  static const signup = Operation('signup');
  static const verify = Operation('verify');
}

class AppEvents {
  static const loggedIn = Event('loggedIn');
  static const loggedOut = Event('loggedOut');
  static const requestedSignUp = Event('sentRegisterRequest');
}
