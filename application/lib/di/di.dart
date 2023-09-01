import 'package:application/stores/cart_store.dart';
import 'package:application/stores/profile_store.dart';

import 'package:application/stores/shop_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
