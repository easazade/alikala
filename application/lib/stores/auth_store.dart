// ignore_for_file: depend_on_referenced_packages

import 'package:application/stores/custom_operations.dart';
import 'package:application/utils/utils_functions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_auth_client/module.dart';

class AuthStore extends Store {
  AuthStore({
    required this.emailAuthController,
    required this.sessionManager,
  }) {
    userInfo.value = sessionManager.signedInUser;
    sessionManager.addListener(onSessionChanges);
  }

  final EmailAuthController emailAuthController;
  final SessionManager sessionManager;

  final userInfo = Data<UserInfo>();
  String? registerRequestEmail;

  bool get isUserAuthenticated => userInfo.hasValue;

  Future<void> login(String? email, String? password) async {
    error = null;
    operation = Operation.none;
    notifyListeners();

    if (email.isNullOrBlank) {
      error = Failure('Please Enter your email', cause: Ops.login);
    } else if (password.isNullOrBlank) {
      error = Failure('Please Enter your password', cause: Ops.login);
    } else {
      operation = Ops.login;
      notifyListeners();
      final result = await emailAuthController.signIn(email!, password!).sealed();
      operation = Operation.none;
      if (result.isSuccessful) {
        userInfo.value = result.value;
      } else {
        //TODO: for 400 errors we should show error message returned from server
        // it's easy to create Failure object out of exceptions, that extract the message
        // from the exception, if there is none a generic something went wrong will be shown
        error = Failure('Could not login, please try again', cause: Ops.login);
      }
    }
    notifyListeners();
  }

  Future<void> requestToSignUp(
    String? email,
    String? username,
    String? password,
    String? confirmPassword,
  ) async {
    error = null;
    operation = Operation.none;
    registerRequestEmail = null;
    notifyListeners();

    if (email == null || !EmailValidator.validate(email)) {
      error = Failure('Please Enter a valid email address', cause: Ops.signup);
    } else if (username == null || username.length < 3) {
      error = Failure('Please Enter a valid username that has at least 3 characters', cause: Ops.signup);
    } else if (password == null || password.length < 8) {
      error = Failure('Please Enter a valid password, at least 8 characters', cause: Ops.signup);
    } else if (password != confirmPassword) {
      error = Failure('Entered passwords don\'t match', cause: Ops.signup);
    } else {
      operation = Ops.signup;
      notifyListeners();
      final result = await emailAuthController.createAccountRequest(username, email, password).sealed();

      operation = Operation.none;
      if (result.isSuccessful) {
        final requestMade = result.value;

        if (requestMade) {
          registerRequestEmail = email;
        } else {
          error = Failure('Cannot register $username, please try again', cause: Ops.signup);
        }
      } else {
        error = Failure('Cannot register $username, please try again', cause: Ops.signup);
      }
    }
    notifyListeners();
  }

  Future<void> verifyAndSignUp(String? verificationCode) async {
    error = null;
    operation = Operation.none;
    notifyListeners();

    if (registerRequestEmail == null) {
      error = Failure('Please Register first', cause: Ops.verify);
    } else if (verificationCode.isNullOrBlank) {
      error = Failure('Please Enter the verification code sent to you email', cause: Ops.verify);
    } else {
      operation = Ops.verify;
      notifyListeners();
      final result = await emailAuthController.validateAccount(registerRequestEmail!, verificationCode!).sealed();
      operation = Operation.none;

      if (result.isSuccessful) {
        userInfo.value = result.value;
      } else {
        error = Failure('Verification code is incorrect', cause: Ops.verify);
      }
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await sessionManager.signOut();
    userInfo.value = null;
    registerRequestEmail = null;
    notifyListeners();
  }

  void onSessionChanges() {
    if (userInfo.valueOrNull != sessionManager.signedInUser) {
      userInfo.value = sessionManager.signedInUser;
    }
  }

  @override
  List<Data<Object?>> get items => [userInfo];

  @override
  void dispose() {
    sessionManager.removeListener(onSessionChanges);
    super.dispose();
  }
}
