import 'package:application/stores/cart_store.dart';
import 'package:application/stores/profile_store.dart';

import 'package:application/stores/shop_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:shop_client/shop_client.dart';

import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart' as auth;

// final _getIt = GetIt.instance;

// T inject<T extends Object>() => _getIt.get<T>();

// Future setupDependencies() async {
//   _getIt.registerLazySingleton(() {
//     final Data<ShopStore> store = ShopStore();
//     return store;
//   });
//   _getIt.registerLazySingleton(() {
//     final Data<ProfileStore> store = ProfileStore();
//     return store;
//   });
// }

final shopStore = ShopStore();
final profileStore = ProfileStore();

final cartStoreProvider = ChangeNotifierProvider((ref) => CartStore());

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
late Client client;
late SessionManager sessionManager;
late auth.EmailAuthController emailAuthController;
