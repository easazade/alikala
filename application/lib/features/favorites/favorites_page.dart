import 'package:application/di/di.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/stores/stores.dart';
import 'package:application/widgets/app_favorite_product_item.dart';
import 'package:application/widgets/util/action_error_widget.dart';
import 'package:application/widgets/util/app_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final profileStore = ref.watch(injectStoreProvider<ProfileStore>());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(S.of(context).favorites, style: theme.textTheme.titleSmall),
        elevation: 1,
      ),
      body: WhenDataBuilder(
        data: profileStore.favoriteItems,
        onValue: (context, favoriteItems) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).yourFavoriteItems, style: theme.textTheme.labelSmall),
                    Text('${favoriteItems.length} ${S.of(context).items}', style: theme.textTheme.labelSmall),
                  ],
                ),
              ),
              SizedBox(height: 15),
              ...favoriteItems.value.map((item) => AppFavoriteProductItem(item.value)).toList(),
              SizedBox(height: 30),
            ],
          );
        },
        onOperate: (context, _) => Center(child: AppProgress.large()),
        onFailure: (context, data) => Center(
          child: ActionErrorWidget(data.failure.message, profileStore.init),
        ),
      ),
    );
  }
}
