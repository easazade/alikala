import 'package:flutter_crystalline/flutter_crystalline.dart';

class Ops {
  static const login = Operation('login');
  static const signup = Operation('signup');
  static const verify = Operation('verify');
}

class Events {
  static const loggedIn = Event('loggedIn');
  static const requestedSignUp = Event('sentRegisterRequest');
}
