import 'package:alikala/stores/shop_store.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

T inject<T extends Object>() => _getIt.get<T>();

Future setupDependencies() async {
  _getIt.registerLazySingleton(() => ShopStore());
}
