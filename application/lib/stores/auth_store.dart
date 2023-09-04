// ignore_for_file: depend_on_referenced_packages

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
