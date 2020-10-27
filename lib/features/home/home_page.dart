import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/app_sliver_amazing_deals.dart';
import 'package:alikala/widgets/app_sliver_double_banner.dart';
import 'package:alikala/widgets/app_sliver_horizontal_products_list.dart';
import 'package:alikala/widgets/app_sliver_most_popular.dart';
import 'package:alikala/widgets/app_sliver_nine_tiles.dart';
import 'package:alikala/widgets/app_sliver_search_bar.dart';
import 'package:alikala/widgets/app_sliver_single_banner.dart';
import 'package:alikala/widgets/app_sliver_sliders.dart';
import 'package:alikala/widgets/util/sliver_sized_box.dart';
import 'package:flutter/material.dart';

import '../../fake_data.dart';

class HomePage extends StatelessWidget {
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
            AppSliverSliders(images: fakeSales),
            SliverSizedBox(height: 20),
            AppSliverAmazingDeals(amazingDeals: fakeAmazingDeals),
            AppSliverNineTiles(
              products: fakeProducts,
              title: 'محصولات مورد پسند مشتریان ما',
              subtitle: 'بر اساس بازدید های شما',
              linkLabel: 'مشاهده همه',
            ),
            AppSliverSingleBanner(imageUrl: fakeSale2),
            SliverSizedBox(height: 30),
            AppSliverMostPopulars(products: fakeProducts, title: 'پرفروش‌ترین کالاها'),
            AppSliverDoubleBanner(imageUrls: fakeSales),
            AppSliverHorizontalProductsList(products: fakeProducts, title: 'کالاهای جدید', linkLabel: 'مشاهده همه'),
          ],
        ),
      ),
    );
  }
}

