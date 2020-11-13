import 'dart:math' as math;

import 'package:alikala/core/constants.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/gen/assets.gen.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/app_add_to_cart.dart';
import 'package:alikala/widgets/app_button.dart';
import 'package:alikala/widgets/app_network_image.dart';
import 'package:alikala/widgets/app_price_tag.dart';
import 'package:alikala/widgets/app_product_color.dart';
import 'package:alikala/widgets/app_secion_separator.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../fake_data.dart';

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
            AppSectionSeparator(height: 5),
            _createCartItem(fakeProducts[0]),
            AppSectionSeparator(height: 5),
            _createCartItem(fakeProducts[1]),
            AppSectionSeparator(height: 5),
            _createCartItem(fakeProducts[2]),
            AppSectionSeparator(height: 5),
            _createCartItem(fakeProducts[3]),
            AppSectionSeparator(height: 5),
            _createCartItem(fakeProducts[4]),
            AppSectionSeparator(height: 5),
            _createCartItem(fakeProducts[5]),
            AppSectionSeparator(),
            _createCartSummary(),
            AppSectionSeparator(),
            _createContinueButton(),
          ],
        ),
      ),
    );
  }

  Widget _createCartItem(Product product) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 30),
                AppNetworkImage(imageUrl: product.images.firstOrNull, width: 100),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title),
                      if (product.color != null) AppProductColor(product),
                    ],
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppAddToCart(product: product, count: 1),
            ),
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
                    Text('ورود یا ثبت نام', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
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
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _createCartSummary() {
    Widget _createPriceItem(String label, int value) {
      return Column(
        children: [
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(fontSize: 14, color: AppColors.TEXT_LIGHT_3)),
              AppPriceTag(value),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
        ],
      );
    }

    return Material(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('خلاصه سبد', style: TextStyle(fontSize: 16)),
                Text('1 کالا', style: TextStyle(fontSize: 12, color: AppColors.TEXT_LIGHT_2)),
              ],
            ),
            SizedBox(height: 20),
            _createPriceItem('مبلغ کل کالا ها', 623000),
            _createPriceItem('جمع', 623000),
          ],
        ),
      ),
    );
  }

  Widget _createContinueButton() {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [],
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(child: AppButton('ادامه خرید', () {})),
            SizedBox(width: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: AppColors.TEXT_LIGHT),
                    Text('مجموع', style: TextStyle(color: AppColors.TEXT_LIGHT, fontWeight: FontWeight.w500)),
                  ],
                ),
                AppPriceTag(615000, sizeFactor: 1.2, color: AppColors.THEME_ACCENT_3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
