// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sailor/sailor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils_classes.dart';
import 'navigation.dart';
import 'injectable.dart';

/// Environment names
const _prod = 'prod';
const _test = 'test';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartiesProd = _$ThirdPartiesProd();
  final thirdPartiesTest = _$ThirdPartiesTest();
  gh.lazySingleton<ConnectionChecker>(() => ConnectionChecker(),
      registerFor: {_prod});
  gh.lazySingleton<FakeConnectionChecker>(() => FakeConnectionChecker(),
      registerFor: {_test});
  gh.factory<Sailor>(() => thirdPartiesTest.sailor, registerFor: {_test});
  final sharedPreferences = await thirdPartiesProd.sharedPreferences;
  gh.factory<SharedPreferences>(() => sharedPreferences, registerFor: {_prod});

  // Eager singletons must be registered in the right order
  gh.singleton<Sailor>(thirdPartiesProd.sailor, registerFor: {_prod});
  return get;
}

class _$ThirdPartiesProd extends ThirdPartiesProd {}

class _$ThirdPartiesTest extends ThirdPartiesTest {
  @override
  MockSailor get sailor => MockSailor();
}
