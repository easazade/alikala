import 'package:application/core/app.dart';
import 'package:application/core/navigation.gr.dart';
import 'package:application/di/di.dart';
import 'package:application/stores/business_logic/category_store.dart';
import 'package:application/widgets/app_sliver_category_list.dart';
import 'package:application/widgets/app_sliver_search_bar.dart';
import 'package:application/widgets/util/app_progress.dart';
import 'package:application/widgets/util/no_scroll_glow.dart';
import 'package:application/widgets/util/retry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CategoryStore store = ref.watch(injectStoreProvider());

    final retryWidget = RetryWidget(() => store.init());

    return Scaffold(
      body: NoScrollIndicator(
        child: WhenDataBuilder(
          data: store,
          onValue: (context, store) {
            final categories = store.categories.items.map((e) => e.value).toList();

            return CustomScrollView(
              slivers: [
                AppSliverSearchBar(context, () => appRouter.navigate(SearchRoute())),
                for (var category in categories) AppSliverCategoryList(subCategories: categories, category: category),
              ],
            );
          },
          onOperate: (context, store) => AppProgress.large(),
          onNoValue: (context, store) => retryWidget,
          onFailure: (context, store) => retryWidget,
        ),
      ),
    );
  }
}
