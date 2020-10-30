import 'package:alikala/fake_data.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/app_sliver_category_list.dart';
import 'package:alikala/widgets/app_sliver_search_bar.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return false;
        },
        child: CustomScrollView(
          slivers: [
            AppSliverSearchBar(context, () {
              showInfoToast('search');
            }),
            for (var category in fakeRootCategories) AppSliverCategoryList(subCategories: fakeSubCategories, category: category),
          ],
        ),
      ),
    );
  }
}
