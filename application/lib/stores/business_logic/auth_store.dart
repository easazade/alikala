// ignore_for_file: depend_on_referenced_packages

import 'package:application/stores/events_operations.dart';
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
    loggedInUser.value = sessionManager.signedInUser;
    sessionManager.addListener(onSessionChanges);
    isLoggedIn = loggedInUser.mapTo<Data<bool>>(Data<bool>(), (origin, mutated) {
      mutated.value = origin.hasValue;
    });
  }

  final EmailAuthController emailAuthController;
  final SessionManager sessionManager;

  final loggedInUser = Data<UserInfo>();
  late Data<bool> isLoggedIn;
  String? registerRequestEmail;

  bool get isUserAuthenticated => loggedInUser.hasValue;

  Future<void> login(String? email, String? password) async {
    failure = null;
    operation = Operation.none;
    notifyListeners();

    if (email.isNullOrBlank) {
      failure = Failure('Please Enter your email', cause: AppOperations.login);
    } else if (password.isNullOrBlank) {
      failure = Failure('Please Enter your password', cause: AppOperations.login);
    } else {
      operation = AppOperations.login;
      notifyListeners();
      final result = await emailAuthController.signIn(email!, password!).sealed();
      operation = Operation.none;
      if (result.isSuccessful) {
        loggedInUser.value = result.value;
        dispatchEvent(AppEvents.loggedIn);
        failure = null;
      } else {
        //TODO: for 400 failures we should show failure message returned from server
        // it's easy to create Failure object out of exceptions, that extract the message
        // from the exception, if there is none a generic something went wrong will be shown
        failure = Failure('Could not login, please try again', cause: AppOperations.login);
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
    failure = null;
    operation = Operation.none;
    registerRequestEmail = null;
    notifyListeners();

    if (email == null || !EmailValidator.validate(email)) {
      failure = Failure('Please Enter a valid email address', cause: AppOperations.signup);
    } else if (username == null || username.length < 3) {
      failure = Failure('Please Enter a valid username that has at least 3 characters', cause: AppOperations.signup);
    } else if (password == null || password.length < 8) {
      failure = Failure('Please Enter a valid password, at least 8 characters', cause: AppOperations.signup);
    } else if (password != confirmPassword) {
      failure = Failure('Entered passwords don\'t match', cause: AppOperations.signup);
    } else {
      operation = AppOperations.signup;
      notifyListeners();
      final result = await emailAuthController.createAccountRequest(username, email, password).sealed();

      operation = Operation.none;
      if (result.isSuccessful) {
        final requestMade = result.value;

        if (requestMade) {
          registerRequestEmail = email;
          dispatchEvent(AppEvents.requestedSignUp);
          failure = null;
        } else {
          failure = Failure('Cannot register $username, please try again', cause: AppOperations.signup);
        }
      } else {
        failure = Failure('Cannot register $username, please try again', cause: AppOperations.signup);
      }
    }
    notifyListeners();
  }

  Future<void> verifyAndSignUp(String? verificationCode) async {
    failure = null;
    operation = Operation.none;
    notifyListeners();

    if (registerRequestEmail == null) {
      failure = Failure('Please Register first', cause: AppOperations.verify);
    } else if (verificationCode.isNullOrBlank) {
      failure = Failure('Please Enter the verification code sent to you email', cause: AppOperations.verify);
    } else {
      operation = AppOperations.verify;
      notifyListeners();
      final result = await emailAuthController.validateAccount(registerRequestEmail!, verificationCode!).sealed();
      operation = Operation.none;

      if (result.isSuccessful) {
        loggedInUser.value = result.value;
        dispatchEvent(AppEvents.loggedIn);
        failure = null;
      } else {
        failure = Failure('Verification code is incorrect', cause: AppOperations.verify);
      }
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await sessionManager.signOut();
    loggedInUser.value = null;
    registerRequestEmail = null;
    dispatchEvent(AppEvents.loggedOut);
    notifyListeners();
  }

  void onSessionChanges() {
    if (loggedInUser.valueOrNull != sessionManager.signedInUser) {
      loggedInUser.value = sessionManager.signedInUser;
      if (isUserAuthenticated) {
        dispatchEvent(AppEvents.loggedIn);
      } else {
        dispatchEvent(AppEvents.loggedOut);
      }
      failure = null;
      notifyListeners();
    }
  }

  @override
  List<Data<Object?>> get items => [loggedInUser];

  @override
  void dispose() {
    sessionManager.removeListener(onSessionChanges);
    super.dispose();
  }
}
