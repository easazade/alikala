import 'package:application/core/constants.dart';
import 'package:application/utils/utils_classes.dart' as utils;
import 'package:application/widgets/app_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_client/shop_client.dart';

class AppSliverMostPopular extends StatelessWidget {
  final List<Product> products;
  final String title;
  final List<List<Product>> _productTuples = [];

  AppSliverMostPopular({required this.products, required this.title}) {
    var stack = utils.StackCollection<Product>();
    // ignore: avoid_function_literals_in_foreach_calls
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
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          return true;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                child: Row(
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
              ),
            ),
          ],
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
          AppNetworkImage(imageUrl: product.images?.firstOrNull, width: 100),
          SizedBox(width: 15),
          Text(
            '${products.indexOf(product) + 1}',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.themeAccent2),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
