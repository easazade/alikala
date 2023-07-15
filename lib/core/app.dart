import 'package:alikala/core/navigation.gr.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:alikala/utils/cupertino_theme_overrides.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:alikala/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants.dart';

final appRouter = AppRouter();

class AliKalaApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AliKalaAppState();
}

class _AliKalaAppState extends State<AliKalaApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        theme: ThemeData(
          //TODO: UPDATE flutter THEME and make it compatible for dark and light
          cupertinoOverrideTheme: MaterialAppCupertinoThemeDataOverrides(FontFamily.opensans),
          primaryColor: AppColors.THEME_ACCENT,
          primaryColorDark: AppColors.THEME_ACCENT,
          primaryColorLight: AppColors.THEME_ACCENT,
          appBarTheme: AppBarTheme(
            foregroundColor: AppColors.TEXT_DARK,
            backgroundColor: AppColors.BG,
          ),
          scaffoldBackgroundColor: Colors.white,
          dialogBackgroundColor: Colors.white,
          //changes appbar and status bar icon colors to light because it indicates that our
          //appbar color we are using is dark
          fontFamily: FontFamily.opensans,
          textTheme: Theme.of(context).textTheme.apply(
                displayColor: AppColors.TEXT_DARK, //default color of texts in app
                bodyColor: AppColors.TEXT_DARK, //default color of texts in app
                fontFamily: FontFamily.opensans,
              ),
        ),
        // locale: DevicePreview.of(context).locale,
        // builder: DevicePreview.appBuilder,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'AliKala',
        routerDelegate: appRouter.delegate(initialRoutes: [
          const SplashRoute(),
        ]),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
