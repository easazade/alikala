import 'dart:async';

import 'package:application/features/splash/splash_screen.dart';
import 'package:application/main.dart';
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

Future setupDependencies() async {
  print('1');
  await _registerHttpClient();
  print('2');
  await _registerAuthDependencies();
  print('3');
  await _registerStores();
  print('4');
  await _registerProviders();
  print('5');
}

Future _registerHttpClient() async {
  // Sets up a singleton client object that can be used to talk to the server from
  // anywhere in our app. The client is generated from your server code.
  // The client is set up to connect to a Serverpod running on a local server on
  // the default port. You will need to modify this to connect to staging or
  // production servers.

  _getIt.registerLazySingleton(
    () => Client(
      'http://$ipAddress:8080/',
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor(),
  );
}

Future _registerAuthDependencies() async {
  // The session manager keeps track of the signed-in state of the user. You
  // can query it to see if the user is currently signed in and get information
  // about the user.
  final sessionManager = SessionManager(caller: inject<Client>().modules.auth);
  await sessionManager.initialize();
  final emailAuthController = auth.EmailAuthController(sessionManager.caller);

  _getIt.registerSingleton(sessionManager);
  _getIt.registerSingleton(emailAuthController);
}

Future _registerStores() async {
  _getIt.registerLazySingleton(() => ShopStore());
  _getIt.registerLazySingleton(() => ProfileStore());
  _getIt.registerLazySingleton(() => CartStore());
}

Future _registerProviders() async {
  _getIt.registerLazySingleton(() => ChangeNotifierProvider((ref) => inject<ShopStore>()));
  _getIt.registerLazySingleton(() => ChangeNotifierProvider((ref) => inject<ProfileStore>()));
  _getIt.registerLazySingleton(() => ChangeNotifierProvider((ref) => inject<CartStore>()));
}

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.

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
      print('setup completed');
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
