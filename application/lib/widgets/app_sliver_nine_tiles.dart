import 'package:application/core/app.dart';
import 'package:application/core/constants.dart';
import 'package:application/core/navigation.gr.dart';
import 'package:application/widgets/app_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_client/shop_client.dart';

class AppSliverNineTiles extends StatelessWidget {
  final List<Product> products;
  final String title;
  final String subtitle;
  final String linkLabel;

  const AppSliverNineTiles({
    required this.products,
    required this.title,
    required this.subtitle,
    required this.linkLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(subtitle, style: TextStyle(color: AppColors.textLight, fontSize: 13)),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              physics: NeverScrollableScrollPhysics(),
              children: [
                for (var product in products.take(9))
                  GridTile(
                    child: GestureDetector(
                      onTap: () {
                        //  sailor.navigate(Routes.product, args: ProductPageArgs(product));
                        appRouter.navigate(ProductRoute(product: product));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[100]!, width: 0.5),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: AppNetworkImage(imageUrl: product.images?.firstOrNull, width: 80),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(linkLabel, style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w500)),
                Icon(CupertinoIcons.forward, color: theme.primaryColor, size: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
