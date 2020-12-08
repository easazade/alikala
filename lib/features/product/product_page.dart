import 'package:alikala/core/constants.dart';
import 'package:alikala/core/navigation.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/fake_data.dart';
import 'package:alikala/widgets/app_add_to_cart.dart';
import 'package:alikala/widgets/app_network_image.dart';
import 'package:alikala/widgets/app_price_tag.dart';
import 'package:alikala/widgets/app_rating.dart';
import 'package:alikala/widgets/slider/app_image_slider.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

class ProductPage extends StatelessWidget {
  final ProductPageArgs args;

  const ProductPage(this.args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.product.title, style: TextStyles.dark_16_w500),
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: sailor.pop,
          child: Icon(FeatherIcons.x),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          _createCartActionItem(5),
          _createAddToFavoriteItem(),
          _createMoreItem(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppImageCarousel(
              fakeProductsImages.length,
              height: MediaQuery.of(context).size.height * 0.3,
              viewport: 1,
              builder: (context, position) => AppNetworkImage(
                imageUrl: fakeProductsImages[position],
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(args.product.title, style: TextStyles.dark_18_w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: AppRating(points: 450, votes: 100),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppAddToCart(product: args.product, showSum: false),
              AppPriceTag(args.product.price),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createCartActionItem(int count) {
    return Container(
      width: 48,
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => sailor.navigate(Routes.cart),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(FeatherIcons.shoppingCart),
            ),
          ),
          Align(
            alignment: Alignment(0.7, 0.4),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                  color: AppColors.THEME_ACCENT,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text('35', style: TextStyles.white_12_w700.copyWith(fontSize: 9)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAddToFavoriteItem() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(FeatherIcons.heart),
      ),
    );
  }

  Widget _createMoreItem() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(FeatherIcons.moreVertical),
      ),
    );
  }
}

class ProductPageArgs extends BaseArguments {
  final Product product;

  ProductPageArgs(this.product);
}
