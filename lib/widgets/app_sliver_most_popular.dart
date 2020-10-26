import 'package:alikala/core/constants.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/utils/utils_classes.dart' as utils;
import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/app_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSliverMostPopulars extends StatelessWidget {
  final List<Product> products;
  final String title;
  List<List<Product>> _productTuples = [];

  AppSliverMostPopulars({@required this.products, @required this.title}) {
    var stack = utils.Stack<Product>();
    products.reversed.forEach((element) => stack.push(element));
    while (stack.canPop()) {
      List<Product> items = [];
      while (stack.canPop() && items.length < 3) {
        items.add(stack.pop());
      }
      _productTuples.add(items);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var tuple3 in _productTuples)
                    Column(
                      children: [
                        for (var product in tuple3) _createProductItemWidget(product),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createProductItemWidget(Product product) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.all(10),
      height: 100,
      width: 270,
      child: Row(
        children: [
          AppNetworkImage(imageUrl: product.images.firstOrNull, width: 100),
          SizedBox(width: 15),
          Text(
            '${products.indexOf(product) + 1}',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.THEME_ACCENT_2),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              product.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
