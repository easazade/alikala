// ignore_for_file: depend_on_referenced_packages

import 'package:application/utils/utils_functions.dart';
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
  final loginOperation = OperationData();

  bool get isUserAuthenticated => userInfo.hasValue;

  Future<void> login(String? email, String? password) async {
    loginOperation.error = null;
    loginOperation.operation = Operation.none;

    if (email.isNullOrBlank) {
      loginOperation.error = Failure('Please Enter your email');
    } else if (password.isNullOrBlank) {
      loginOperation.error = Failure('Please Enter your password');
    } else {
      loginOperation.operation = Operation.operating;
      final result = await emailAuthController.signIn(email!, password!).sealed();
      loginOperation.operation = Operation.none;
      if (result.isSuccessful) {
        userInfo.value = result.value;
      } else {
        //TODO: for 400 errors we should show error message returned from server
        // it's easy to create Failure object out of exceptions, that extract the message
        // from the exception, if there is none a generic something went wrong will be shown
        loginOperation.error = Failure('Could not login, please try again');
      }
    }
  }

  Future<void> requestToSignUp(
    String email,
    String username,
    String password,
    String confirmPassword,
  ) async {}

  Future<void> verifyAndSignUp(String email, String verificationCode) async {}

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
