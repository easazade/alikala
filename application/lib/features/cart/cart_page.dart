import 'dart:math' as math;

import 'package:application/core/app.dart';
import 'package:application/core/constants.dart';
import 'package:application/core/navigation.gr.dart';
import 'package:application/di/di.dart';
import 'package:application/gen/assets.gen.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/stores/business_logic/auth_store.dart';
import 'package:application/stores/business_logic/cart/cart_store.dart';
import 'package:application/stores/business_logic/cart/event.dart';
import 'package:application/utils/utils_functions.dart';
import 'package:application/widgets/app_add_to_cart.dart';
import 'package:application/widgets/app_button.dart';
import 'package:application/widgets/app_network_image.dart';
import 'package:application/widgets/app_price_tag.dart';
import 'package:application/widgets/app_section_separator.dart';
import 'package:application/widgets/util/no_scroll_glow.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_client/shop_client.dart';

class CartPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartStore = ref.watch(injectStoreProvider<CartStore>());
    final authStore = ref.watch(injectStoreProvider<AuthStore>());
    final theme = Theme.of(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          S.of(context).shoppingCart,
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: NoScrollIndicator(
        child: DataBuilder(
          data: cartStore.cart,
          builder: (context, cart) {
            return ListView(
              children: [
                if (!authStore.isUserAuthenticated) _createLoginNeededCard(),
                SizedBox(height: 30),
                _createCartIsEmptyMessage(cartStore),
                if (cart.hasValue && cart.value.items != null)
                  for (var cartItem in cart.value.items!) ...[
                    AppSectionSeparator(height: 5),
                    _createCartItem(
                      cartItem,
                      (cart.operation is UpdateCartItemOperation &&
                              (cart.operation as UpdateCartItemOperation).productId == cartItem.productId)
                          ? cart.operation as UpdateCartItemOperation
                          : null,
                    ),
                  ],
                if (cart.hasValue && cart.value.items?.isNotEmpty == true) ...[
                  AppSectionSeparator(),
                  _createCartSummary(context, cart.value),
                  AppSectionSeparator(),
                  _createContinueButton(context, cart.value),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _createCartItem(CartItem cartItem, UpdateCartItemOperation? cartItemOperation) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 20),
            if (cartItemOperation != null) Text('Updating'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 30),
                AppNetworkImage(imageUrl: cartItem.product?.images?.firstOrNull, width: 100),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.product!.name),
                      // if (cartItem.value.color != null) AppProductColor(cartItem.value),
                    ],
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppAddToCart(product: cartItem.product!),
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
                child: Icon(FeatherIcons.logIn, color: AppColors.orange),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.current.loginOrSignUp, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      Text(S.current.forABetterExperienceInOurShopPleaseLogin),
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
            onTap: () {},
            child: Image.asset(
              Assets.images.emptyCart.path,
              width: 150,
            ),
          ),
          Text(S.current.youreShoppingCartIsEmpty),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _createCartSummary(BuildContext context, Cart cart) {
    Widget createPriceItem(String label, int value) {
      return Column(
        children: [
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(fontSize: 14, color: AppColors.textLight3)),
              AppPriceTag(value),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
        ],
      );
    }

    final totalAmount = cart.items?.fold(0, (sum, item) => sum + (item.product?.price ?? 0)) ?? 0;

    if (cart.items?.isNotEmpty == true) {
      return Material(
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.current.summary, style: TextStyle(fontSize: 16)),
                  Text('${cart.items!.length} ${S.current.items}',
                      style: TextStyle(fontSize: 12, color: AppColors.textLight2)),
                ],
              ),
              SizedBox(height: 20),
              for (var cartItem in cart.items!)
                if (cartItem.product != null)
                  createPriceItem(cartItem.product!.name, cartItem.product!.price)
                else
                  Text('Error, cannot show cart item price'),
              createPriceItem(S.of(context).totalAmount, totalAmount),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _createContinueButton(BuildContext context, Cart cart) {
    final totalAmount = cart.items?.fold(0, (sum, item) => sum + (item.product?.price ?? 0)) ?? 0;

    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [],
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(child: AppButton(S.of(context).continueBrowsing, () {})),
            SizedBox(width: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: AppColors.textLight),
                    Text(S.of(context).total,
                        style: TextStyle(color: AppColors.textLight, fontWeight: FontWeight.w500)),
                  ],
                ),
                AppPriceTag(totalAmount, sizeFactor: 1.2, color: AppColors.themeAccent3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
