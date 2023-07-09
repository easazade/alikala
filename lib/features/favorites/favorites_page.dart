import 'package:alikala/core/constants.dart';
import 'package:alikala/fake_data.dart';
import 'package:alikala/widgets/app_favorite_product_item.dart';
import 'package:alikala/widgets/util/no_scroll_glow.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Favorites', style: TextStyles.dark_18_w700),
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
                  Text('Your favorite items', style: TextStyles.light_14_w500),
                  // ignore: prefer_adjacent_string_concatenation
                  Text('${fakeProducts.length}' + ' items', style: TextStyles.light_14_w500),
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
