import 'package:alikala/core/app.dart';
import 'package:alikala/core/navigation.gr.dart';
import 'package:alikala/di/di.dart';
import 'package:alikala/stores/shop_store.dart';
import 'package:alikala/arcitecture/store_consumer.dart';
import 'package:alikala/widgets/app_sliver_amazing_deals.dart';
import 'package:alikala/widgets/app_sliver_double_banner.dart';
import 'package:alikala/widgets/app_sliver_horizontal_products_list.dart';
import 'package:alikala/widgets/app_sliver_most_popular.dart';
import 'package:alikala/widgets/app_sliver_nine_tiles.dart';
import 'package:alikala/widgets/app_sliver_search_bar.dart';
import 'package:alikala/widgets/app_sliver_single_banner.dart';
import 'package:alikala/widgets/app_sliver_sliders.dart';
import 'package:alikala/widgets/util/no_scroll_glow.dart';
import 'package:alikala/widgets/util/sliver_sized_box.dart';
import 'package:flutter/material.dart';

import '../../fake_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConsumer<ShopStore>(
        store: inject(),
        builder: (context, store) {
          return Scaffold(
            appBar: AppBar(
              title: (store.shopName.isLoading)
                  ? CircularProgressIndicator(color: Colors.black)
                  : GestureDetector(
                      onTap: () => store.setShopName('WHAT'),
                      child: (store.shopName.isAvailable) ? Text(store.shopName.value) : Text('NONE'),
                    ),
            ),
            body: NoScrollGlow(
              child: CustomScrollView(
                slivers: [
                  AppSliverSearchBar(context, () => appRouter.navigate(SearchRoute())),
                  SliverToBoxAdapter(
                    child: store.shopName.buildWhen(
                      onAvailable: (context, data) => Text('${data.value} &&'),
                      onLoading: (context, data) => CircularProgressIndicator(color: Colors.red),
                    ),
                  ),
                  AppSliverSliders(images: fakeSales),
                  SliverSizedBox(height: 20),
                  AppSliverAmazingDeals(amazingDeals: fakeAmazingDeals),
                  AppSliverNineTiles(
                    products: fakeProducts,
                    title: '?????????????? ???????? ???????? ?????????????? ????',
                    subtitle: '???? ???????? ???????????? ?????? ??????',
                    linkLabel: '???????????? ??????',
                  ),
                  AppSliverSingleBanner(imageUrl: fakeSale2),
                  SliverSizedBox(height: 30),
                  AppSliverMostPopulars(products: fakeProducts, title: '??????????????????????? ????????????'),
                  AppSliverDoubleBanner(imageUrls: fakeSales),
                  AppSliverHorizontalProductsList(
                    products: fakeProducts,
                    title: '?????????????? ????????',
                    linkLabel: '???????????? ??????',
                    onLinkClicked: () {},
                  ),
                ],
              ),
            ),
          );
        });
  }
}
