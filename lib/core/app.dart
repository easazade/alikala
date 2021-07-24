import 'package:alikala/core/navigation.gr.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:alikala/utils/cupertino_theme_overrides.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants.dart';
import 'lang/languages.dart';

///HafezApp is the application Widget defined for this application
///which is added to the very top of the widget tree providing info about the app
///configurations, theme, fonts, localizations, app name, starting page, navigation etc.
///

final appRouter = AppRouter();

class Application extends StatefulWidget {
  Application();

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        cupertinoOverrideTheme: MaterialAppCupertinoThemeDataOverrides(FontFamily.estedadFD),
        accentColor: AppColors.THEME_ACCENT,
        primaryColor: AppColors.THEME_ACCENT,
        primaryColorBrightness: Brightness.light,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        //changes appbar and status bar icon colors to light because it indicates that our
        //appbar color we are using is dark
        fontFamily: FontFamily.estedadFD,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: AppColors.TEXT_DARK, //default color of texts in app
              bodyColor: AppColors.TEXT_DARK, //default color of texts in app
              fontFamily: FontFamily.estedadFD,
            ),
      ),
      locale: Locale('fa', ''),
      // locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      localizationsDelegates: [
        const TranslationBaseDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fa', ''), // Persian
        const Locale('en', ''), // English
      ],
      debugShowCheckedModeBanner: false,
      //theme: hrTheme,
      title: 'AliKala',
      routerDelegate: appRouter.delegate(initialRoutes: [SplashRoute()]),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }

  // Widget startingPage(BuildContext context) {
  //   // if (kReleaseMode) {
  //   return SplashPage();
  //   // } else {
  //   // return MainScreen();
  //   // }
  // }
}
