import 'package:alikala/core/constants.dart';
import 'package:alikala/core/navigation.dart';
import 'package:alikala/fake_data.dart';
import 'package:alikala/widgets/app_sliver_category_list.dart';
import 'package:alikala/widgets/app_sliver_search_bar.dart';
import 'package:alikala/widgets/util/no_scroll_glow.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoScrollGlow(
        child: CustomScrollView(
          slivers: [
            AppSliverSearchBar(context, () => sailor.navigate(Routes.search)),
            for (var category in fakeRootCategories) AppSliverCategoryList(subCategories: fakeSubCategories, category: category),
          ],
        ),
      ),
    );
  }
}
