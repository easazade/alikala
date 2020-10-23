import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sailor/sailor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injectable.config.dart';
import 'navigation.dart';

///this file is laying out the configuration of the DI graph used in this application

///this is a global instance object of the GetIt class defined in this app
///all the components that exist in the DI injection graph of the app are accessible through this object
final getIt = GetIt.instance;
String currentEnvironment;

///initializing the DI graph configured using GetIt package
///this method should be called at the start of the application
@injectableInit
Future configureDI(String environment) {
  currentEnvironment = environment;
  return $initGetIt(getIt, environment: environment);
}

extension GetItEXT on GetIt {
//  LoginBloc newLoginBloc({ConnectionChecker checkConnection}) => LoginBloc(
//      getIt.get(instanceName: 'repository'), checkConnection ?? getIt.get());
//
//  HomeBloc newHomeBloc() =>
//      HomeBloc(getIt.get(instanceName: 'repository'), getIt.get());
//
//  CourseCubit newCourseCubit() =>
//      CourseCubit(getIt.get(instanceName: 'repository'), getIt.get());
}

///this class provides 2 types of environment for Dependency injection graph

abstract class Env {
  ///prod for building and creating a production version of the app
  static const prod = 'prod';

  ///test for unit-testing purposes
  static const test = 'test';
}

//############################### GetIt modules for third part libraries ########################################

@module
abstract class ThirdPartiesProd {
  @Singleton(env: [Env.prod])
  Sailor get sailor => Sailor(
        options: SailorOptions(
          isLoggingEnabled: kReleaseMode,
        ),
      ); //defining custom initializer

  @preResolve
  @Injectable(env: [Env.prod])
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}

@module
abstract class ThirdPartiesTest {
  @Injectable(as: Sailor, env: [Env.test])
  MockSailor get sailor; //uses default initializer
}
