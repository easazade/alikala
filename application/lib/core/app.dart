import 'package:application/core/navigation.gr.dart';
import 'package:application/core/theme.dart';
import 'package:application/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:application/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouter = AppRouter();

class AliKalaApp extends StatefulWidget {
  const AliKalaApp({super.key});

  @override
  State<StatefulWidget> createState() => _AliKalaAppState();
}

class _AliKalaAppState extends State<AliKalaApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: DI(
        child: MaterialApp.router(
          theme: appTheme(Brightness.light),
          darkTheme: appTheme(Brightness.dark),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'AliKala',
          routerDelegate: appRouter.delegate(
            initialRoutes: [
              const MainRoute(),
            ],
          ),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
