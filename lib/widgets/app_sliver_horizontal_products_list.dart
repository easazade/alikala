import 'package:alikala/core/constants.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_network_image.dart';

class AppSliverHorizontalProductsList extends StatelessWidget {
  final List<Product> products;
  final String title;
  final String linkLabel;
  final VoidCallback onLinkClicked;

  const AppSliverHorizontalProductsList({
    Key key,
    @required this.products,
    @required this.title,
    @required this.linkLabel,
    @required this.onLinkClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppHorizontalProductsList(
        products: products,
        title: title,
        linkLabel: linkLabel,
        onLinkClicked: onLinkClicked,
      ),
    );
  }
}

class AppHorizontalProductsList extends StatelessWidget {
  final List<Product> products;
  final String title;
  final String linkLabel;
  final VoidCallback onLinkClicked;

  const AppHorizontalProductsList({
    Key key,
    @required this.products,
    @required this.title,
    @required this.linkLabel,
    @required this.onLinkClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) => true,
      child: Container(
        height: 280,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  Row(
                    children: [
                      TextButton(
                        child: Text(
                          linkLabel,
                          style: TextStyle(fontSize: 13, color: AppColors.THEME_ACCENT_2, fontWeight: FontWeight.w500),
                        ),
                        onPressed: onLinkClicked,
                      ),
                      Icon(CupertinoIcons.forward, color: AppColors.THEME_ACCENT_2, size: 18),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, position) => Container(
                  color: Colors.grey[100],
                  width: 1,
                ),
                shrinkWrap: true,
                itemBuilder: (context, position) => _createProductItem(products[position]),
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createProductItem(Product product) {
    return Container(
      width: 160,
      height: 280,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          AppNetworkImage(imageUrl: product.images.firstOrNull, width: 120, height: 80),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //off percentage
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                  color: AppColors.THEME_ACCENT,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text('${product.offPercentage.toInt()}%', style: TextStyle(color: Colors.white, fontSize: 11)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${product.offPrice.commaSeparated()}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                      SizedBox(width: 2),
                      Text('تومان', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Text(
                    '${product.price.commaSeparated()}',
                    style: TextStyle(
                      color: AppColors.TEXT_LIGHT,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
