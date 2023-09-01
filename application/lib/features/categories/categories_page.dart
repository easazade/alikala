import 'package:application/core/app.dart';
import 'package:application/core/navigation.gr.dart';
import 'package:application/fake_data.dart';
import 'package:application/widgets/app_sliver_category_list.dart';
import 'package:application/widgets/app_sliver_search_bar.dart';
import 'package:application/widgets/util/no_scroll_glow.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoScrollIndicator(
        child: CustomScrollView(
          slivers: [
            AppSliverSearchBar(context, () {
              appRouter.navigate(SearchRoute());
            }),
            for (var category in fakeRootCategories)
              AppSliverCategoryList(subCategories: fakeSubCategories, category: category),
          ],
        ),
      ),
    );
  }
}
