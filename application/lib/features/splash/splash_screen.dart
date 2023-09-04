import 'package:application/core/constants.dart';
import 'package:application/gen/assets.gen.dart';
import 'package:application/widgets/util/app_progress.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage();

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        color: AppColors.primary,
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
                  Text('AliKala', style: TextStyle(color: Colors.white, fontSize: 32)),
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
      ),
    );
  }
}
