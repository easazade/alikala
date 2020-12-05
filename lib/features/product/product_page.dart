import 'package:alikala/core/constants.dart';
import 'package:alikala/core/navigation.dart';
import 'package:alikala/data/entities.dart';
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
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(FeatherIcons.heart),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(FeatherIcons.moreVertical),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
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
            onTap: () {},
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
}

class ProductPageArgs extends BaseArguments {
  final Product product;

  ProductPageArgs(this.product);
}
