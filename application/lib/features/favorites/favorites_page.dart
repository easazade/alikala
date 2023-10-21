import 'package:application/generated/l10n.dart';
import 'package:application/widgets/app_favorite_product_item.dart';
import 'package:application/widgets/util/no_scroll_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            // TODO: Uncomment and Refactor
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(S.of(context).yourFavoriteItems, style: theme.textTheme.labelSmall),
            //       Text('${favoriteProduct.length} ${S.of(context).items}', style: theme.textTheme.labelSmall),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 15),
            // ...fakeProducts.map((item) => AppFavoriteProductItem(item)).toList(),
            // SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
