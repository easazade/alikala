import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, //then set brightness in AppBar widget to light to get dark icons
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(AliKalaApp());
}
