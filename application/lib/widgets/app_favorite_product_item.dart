import 'package:application/widgets/app_network_image.dart';
import 'package:application/widgets/app_price_tag.dart';
import 'package:flutter/material.dart';
import 'package:shop_client/shop_client.dart';

class AppFavoriteProductItem extends StatelessWidget {
  final Product product;

  const AppFavoriteProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      height: 110,
      child: Column(
        children: [
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNetworkImage(
                imageUrl: product.images?.firstOrNull,
                width: size.width * 0.35,
                height: 80,
              ),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(product.name, maxLines: 2, style: Theme.of(context).textTheme.labelMedium),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppPriceTag(product.price, color: Colors.grey),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          Expanded(child: SizedBox(height: 1)),
          Container(width: size.width, height: 1, color: Colors.grey[200]),
        ],
      ),
    );
  }
}
