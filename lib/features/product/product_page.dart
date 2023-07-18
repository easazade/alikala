import 'package:alikala/core/app.dart';
import 'package:alikala/core/constants.dart';
import 'package:alikala/core/navigation.gr.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/fake_data.dart';
import 'package:alikala/generated/l10n.dart';
import 'package:alikala/utils/utils_classes.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/app_add_to_cart.dart';
import 'package:alikala/widgets/app_horizontal_comments_list.dart';
import 'package:alikala/widgets/app_network_image.dart';
import 'package:alikala/widgets/app_price_tag.dart';
import 'package:alikala/widgets/app_product_color_selector.dart';
import 'package:alikala/widgets/app_rating.dart';
import 'package:alikala/widgets/app_section_separator.dart';
import 'package:alikala/widgets/app_sliver_horizontal_products_list.dart';
import 'package:alikala/widgets/slider/app_image_slider.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage(this.product);

  final pagePadding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, style: TextStyles.dark_16_w500),
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
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
                child: Text(product.title, style: TextStyles.dark_18_w700),
              ),
            ),
            Padding(
              padding: pagePadding,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: AppRating(points: 450, votes: 100),
              ),
            ),
            divider(context, padding: pagePadding),
            Padding(
              padding: pagePadding,
              child: AppProductColorSelector(
                namesToColors: {
                  'black': Colors.black,
                  'blue': Colors.blue,
                  'red': Colors.red,
                },
                onChange: (colorName, color) => showSuccessToast(colorName),
              ),
            ),
            SizedBox(height: 20),
            AppSectionSeparator(),
            SizedBox(height: 10),
            _createProductFeatures(context),
            SizedBox(height: 10),
            AppSectionSeparator(),
            SizedBox(height: 10),
            AppHorizontalProductsList(
              products: fakeProducts,
              title: S.of(context).similarItems,
              linkLabel: S.of(context).viewAll,
              onLinkClicked: () {},
            ),
            SizedBox(height: 10),
            AppSectionSeparator(),
            SizedBox(height: 10),
            AppHorizontalCommentsList(
              comments: fakeComments,
              title: S.of(context).buyersComments,
              linkLabel: S.of(context).viewAll,
              onLinkClicked: () {},
            )
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
              AppAddToCart(product: product, showSum: false),
              AppPriceTag(product.price),
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
            onTap: () {
              appRouter.navigate(CartRoute());
            },
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

  Widget _createProductFeatures(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).acoutProduct, style: TextStyles.dark_16_w500),
          SizedBox(height: 15),
          divider(context),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).productDetails, style: TextStyles.dark_16_w500),
              Icon(CupertinoIcons.forward, size: 20, color: Colors.grey),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
