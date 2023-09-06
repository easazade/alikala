import 'dart:async';

import 'package:application/features/splash/splash_screen.dart';
import 'package:application/stores/auth_store.dart';
import 'package:application/stores/cart_store.dart';
import 'package:application/stores/profile_store.dart';

import 'package:application/stores/shop_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shop_client/shop_client.dart';

import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart' as auth;

// The android emulator does not have access to the localhost of the machine.
// const ipAddress = '10.0.2.2'; // Android emulator ip for the host

// On a real device replace the ipAddress with the IP address of your computer.
const ipAddress = '192.168.1.100';

final _getIt = GetIt.instance;

T inject<T extends Object>() => _getIt.get<T>();

ChangeNotifierProvider<T> injectStoreProvider<T extends ChangeNotifier>() => inject<ChangeNotifierProvider<T>>();

Future setupDependencies() async {
  await _registerHttpClient();
  await _registerAuthDependencies();
  await _registerStores();
  await _registerProviders();
}

Future _registerHttpClient() async {
  _getIt.registerLazySingleton(
    () => Client(
      'http://$ipAddress:8080/',
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor(),
  );
}

Future _registerAuthDependencies() async {
  final sessionManager = SessionManager(caller: inject<Client>().modules.auth);
  await sessionManager.initialize();
  final emailAuthController = auth.EmailAuthController(sessionManager.caller);

  _getIt.registerSingleton(sessionManager);
  _getIt.registerSingleton(emailAuthController);
}

Future _registerStores() async {
  _getIt.registerLazySingleton(() => AuthStore(emailAuthController: inject(), sessionManager: inject()));
  _getIt.registerLazySingleton(() => ShopStore());
  _getIt.registerLazySingleton(() => ProfileStore());
  _getIt.registerLazySingleton(() => CartStore());
}

Future _registerProviders() async {
  _getIt.registerLazySingleton(() => ChangeNotifierProvider((ref) => inject<AuthStore>()));
  _getIt.registerLazySingleton(() => ChangeNotifierProvider((ref) => inject<ShopStore>()));
  _getIt.registerLazySingleton(() => ChangeNotifierProvider((ref) => inject<ProfileStore>()));
  _getIt.registerLazySingleton(() => ChangeNotifierProvider((ref) => inject<CartStore>()));
}

/// Shows child when dependency setup is completed.
class DI extends StatefulWidget {
  const DI({required this.child});

  final Widget child;

  @override
  State<DI> createState() => _DIState();
}

class _DIState extends State<DI> {
  final _dependencyGraphSetup = Completer<String>();

  @override
  void initState() {
    super.initState();
    setupDependencies().then((_) {
      _dependencyGraphSetup.complete('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dependencyGraphSetup.future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return widget.child;
        } else {
          return SplashPage();
        }
      },
    );
  }
}
