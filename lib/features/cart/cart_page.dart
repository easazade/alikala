import 'dart:math' as math;

import 'package:alikala/core/constants.dart';
import 'package:alikala/gen/assets.gen.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'سبد خرید',
          style: TextStyle(
            color: AppColors.THEME_ACCENT,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return false;
        },
        child: ListView(
          children: [
            _createLoginNeededCard(),
            SizedBox(height: 30),
            _createCartIsEmptyMessage(),
          ],
        ),
      ),
    );
  }

  Widget _createLoginNeededCard() {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 2.3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.rotate(
              angle: math.pi,
              child: Icon(FeatherIcons.logIn, color: AppColors.THEME_ORANGE),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ورود یا ثبت نام',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                    Text('برای تجربه بهتر خرید و بررسی روش ارسال کالاها لطفا وارد شوید.'),
                  ],
                ),
              ),
            ),
            Icon(CupertinoIcons.forward, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _createCartIsEmptyMessage() {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            Assets.images.emptyCart.assetName,
            width: 150,
          ),
          Text('سبد خرید شما خالی است.'),
        ],
      ),
    );
  }
}
