import 'package:alikala/stores/cart_store.dart';
import 'package:alikala/stores/profile_store.dart';

import 'package:alikala/stores/shop_store.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

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
