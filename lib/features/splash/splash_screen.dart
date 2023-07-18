import 'package:alikala/core/app.dart';
import 'package:alikala/core/constants.dart';
import 'package:alikala/core/navigation.gr.dart';
import 'package:alikala/gen/assets.gen.dart';
import 'package:alikala/generated/l10n.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/util/app_progress.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage();

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(.5.seconds(), () {
      appRouter.replace(MainRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.THEME_ACCENT,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Image.asset(Assets.images.splashLogo.path, width: 150),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).alikala, style: TextStyle(color: Colors.white, fontSize: 32)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: AppProgress.small(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
