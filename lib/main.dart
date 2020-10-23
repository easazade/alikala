import 'dart:async';

import 'package:alikala/utils/utils_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:footprint/footprint.dart';
import 'package:sailor/sailor.dart';

import 'core/app.dart';
import 'core/injectable.dart';
import 'core/navigation.dart';
import 'utils/footprint_configs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpFootprint();
  //hiding statusbar and only showing navigation bar
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
// setting transparent statusbar
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//    statusBarColor: Colors.transparent, //then set brightness in AppBar widget to light to get dark icons
//    statusBarIconBrightness: Brightness.light,
//  ));
//  Crashlytics.instance.enableInDevMode = true;
//  FlutterError.onError = Crashlytics.instance.recordFlutterError;
//  analytics = FirebaseAnalytics();
//  Future.delayed(const Duration(seconds: 7)).then((value) {
//    throw Exception('this is a test');
//  });
  await configureDI(Env.prod);
  sailor = getIt.get<Sailor>();
  NavigationConfig.createRoutes();
  // await AppInfo.init();
  runZoned(() {
    runApp(Application());
  }, onError: report);
}

Future setUpFootprint() async {
//  Directory saveDir = await getApplicationDocumentsDirectory();
//  Footprint.privateService = PrivateService(1000, saveDir, (file) async{
//
//  });
  Footprint.config = (kReleaseMode) ? FootprintReleaseConfig() : FootprintDebugConfig();
}
