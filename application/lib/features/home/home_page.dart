import 'package:application/core/app.dart';
import 'package:application/core/navigation.gr.dart';
import 'package:application/di/di.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/stores/shop_store.dart';
import 'package:application/widgets/app_sliver_amazing_deals.dart';
import 'package:application/widgets/app_sliver_double_banner.dart';
import 'package:application/widgets/app_sliver_horizontal_products_list.dart';
import 'package:application/widgets/app_sliver_most_popular.dart';
import 'package:application/widgets/app_sliver_nine_tiles.dart';
import 'package:application/widgets/app_sliver_search_bar.dart';
import 'package:application/widgets/app_sliver_single_banner.dart';
import 'package:application/widgets/app_sliver_sliders.dart';
import 'package:application/widgets/util/no_scroll_glow.dart';
import 'package:application/widgets/util/sliver_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';

import '../../fake_data.dart';

class HomePage extends StatelessWidget {
  final ShopStore shopStore = inject();

  @override
  Widget build(BuildContext context) {
    return DataBuilder(
        data: shopStore,
        observe: true,
        builder: (context, _) {
          return Scaffold(
            appBar: AppBar(
              title: (shopStore.shopName.isOperating)
                  ? CircularProgressIndicator(color: Colors.black)
                  : GestureDetector(
                      onTap: () => shopStore.setShopName('WHAT'),
                      child: (shopStore.shopName.hasValue) ? Text(shopStore.shopName.value) : Text('NONE'),
                    ),
            ),
            body: NoScrollIndicator(
              child: CustomScrollView(
                slivers: [
                  AppSliverSearchBar(context, () => appRouter.navigate(SearchRoute())),
                  // SliverToBoxAdapter(
                  //   child: WhenDataBuilder(
                  //     data: shopStore.shopName,
                  //     onValue: (context, data) => Text('${data.value} &&'),
                  //     onCustomOperation: (context, data) => Text('CUSTOM OPERATION RUNNING = ${data.operation.name}'),
                  //     onOperate: (context, data) => CircularProgressIndicator(color: Colors.red),
                  //   ),
                  // ),
                  AppSliverSliders(images: fakeSales),
                  SliverSizedBox(height: 20),
                  AppSliverAmazingDeals(amazingDeals: fakeAmazingDeals),
                  AppSliverNineTiles(
                    products: fakeProducts,
                    title: S.of(context).mostLikedByCustomers,
                    subtitle: S.of(context).thingsYouMightLike,
                    linkLabel: S.of(context).viewAll,
                  ),
                  AppSliverSingleBanner(imageUrl: fakeSale2),
                  SliverSizedBox(height: 30),
                  AppSliverMostPopulars(products: fakeProducts, title: S.of(context).topSales),
                  AppSliverDoubleBanner(imageUrls: fakeSales),
                  AppSliverHorizontalProductsList(
                    products: fakeProducts,
                    title: S.of(context).newItems,
                    linkLabel: S.of(context).viewAll,
                    onLinkClicked: () {},
                  ),
                ],
              ),
            ),
          );
        });
  }
}
