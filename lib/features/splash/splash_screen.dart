import 'package:alikala/core/constants.dart';
import 'package:alikala/gen/assets.gen.dart';
import 'package:alikala/widgets/util/app_progress.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: AppColors.THEME_ACCENT,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset(Assets.images.splashLogo.assetName, width: 150),
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
                padding: const EdgeInsets.all(8.0),
                child: AppProgress.small(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
