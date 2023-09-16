import 'dart:async';

import 'package:application/config.dart';
import 'package:application/features/splash/splash_screen.dart';
import 'package:application/stores/stores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shop_client/shop_client.dart';

import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart' as auth;

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
      AppConfig.baseUrl,
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
  _getIt.registerLazySingleton(() => ShopStore(client: inject()));
  _getIt.registerLazySingleton(() => ProfileStore());
  _getIt.registerLazySingleton(() => CartStore(client: inject()));
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
  var _dependencyGraphSetup = Completer<bool>();

  @override
  void initState() {
    super.initState();
    _runSetup();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dependencyGraphSetup.future,
      builder: (context, snapshot) {
        final hasSetupDependenciesSuccessfully = snapshot.data == true;
        if (snapshot.hasData) {
          if (hasSetupDependenciesSuccessfully) {
            return widget.child;
          } else {
            return SplashPage(
              isLoading: false,
              retry: () {
                _dependencyGraphSetup = Completer();
                setState(() {
                  _runSetup();
                });
              },
            );
          }
        } else {
          return SplashPage(isLoading: true);
        }
      },
    );
  }

  void _runSetup() {
    setupDependencies().then(
      (_) => _dependencyGraphSetup.complete(true),
      onError: (e, stacktrace) {
        print(e);
        print(stacktrace);
        _dependencyGraphSetup.complete(false);
      },
    );
  }
}
