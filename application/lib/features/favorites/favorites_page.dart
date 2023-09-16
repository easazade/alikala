import 'package:application/fake_data.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/widgets/app_favorite_product_item.dart';
import 'package:application/widgets/util/no_scroll_glow.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(S.of(context).favorites, style: theme.textTheme.titleSmall),
        elevation: 1,
      ),
      body: NoScrollIndicator(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).yourFavoriteItems, style: theme.textTheme.labelSmall),
                  Text('${fakeProducts.length} ${S.of(context).items}', style: theme.textTheme.labelSmall),
                ],
              ),
            ),
            SizedBox(height: 15),
            ...fakeProducts.map((item) => AppFavoriteProductItem(item)).toList(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
