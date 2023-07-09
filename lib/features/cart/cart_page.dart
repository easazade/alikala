import 'dart:math' as math;

import 'package:alikala/core/app.dart';
import 'package:alikala/core/constants.dart';
import 'package:alikala/core/navigation.gr.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/di/di.dart';
import 'package:alikala/gen/assets.gen.dart';
import 'package:alikala/stores/cart_store.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/app_add_to_cart.dart';
import 'package:alikala/widgets/app_button.dart';
import 'package:alikala/widgets/app_network_image.dart';
import 'package:alikala/widgets/app_price_tag.dart';
import 'package:alikala/widgets/app_product_color.dart';
import 'package:alikala/widgets/app_section_separator.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartStore = ref.watch(cartStoreProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Shopping Cart',
          style: TextStyle(
            color: AppColors.THEME_ACCENT,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: DataBuilder(
          data: cartStore,
          observe: true,
          builder: (context, store) {
            return ListView(
              children: [
                _createLoginNeededCard(),
                SizedBox(height: 30),
                _createCartIsEmptyMessage(cartStore),
                for (var product in store.products) ...[
                  AppSectionSeparator(height: 5),
                  _createCartItem(product),
                ],
                AppSectionSeparator(),
                _createCartSummary(),
                AppSectionSeparator(),
                _createContinueButton(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _createCartItem(Data<Product> product) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 20),
            if (product.isDeleting) Text('Deleting'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 30),
                AppNetworkImage(imageUrl: product.value.images.firstOrNull, width: 100),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.value.title),
                      if (product.value.color != null) AppProductColor(product.value),
                    ],
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppAddToCart(product: product.value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createLoginNeededCard() {
    return GestureDetector(
      onTap: () {
        appRouter.push(LoginRoute());
      },
      child: Card(
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
                      Text('Login or Sign up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      Text('For a better experience in Our Shop please Login'),
                    ],
                  ),
                ),
              ),
              Icon(CupertinoIcons.forward, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createCartIsEmptyMessage(CartStore cartStore) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (cartStore.products.isNotEmpty) {
                cartStore.removeProduct();
              } else {
                cartStore.addProduct();
              }
            },
            child: Image.asset(
              Assets.images.emptyCart.assetName,
              width: 150,
            ),
          ),
          Text('You\'re shopping cart is empty'),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _createCartSummary() {
    Widget createPriceItem(String label, int value) {
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
                Text('Summary', style: TextStyle(fontSize: 16)),
                Text('1 item', style: TextStyle(fontSize: 12, color: AppColors.TEXT_LIGHT_2)),
              ],
            ),
            SizedBox(height: 20),
            createPriceItem('Total Amount', 623000),
            createPriceItem('Sum', 623000),
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
            Expanded(child: AppButton('Continue Browsing', () {})),
            SizedBox(width: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: AppColors.TEXT_LIGHT),
                    Text('Total', style: TextStyle(color: AppColors.TEXT_LIGHT, fontWeight: FontWeight.w500)),
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
