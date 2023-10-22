import 'package:application/core/app.dart';
import 'package:application/core/navigation.gr.dart';
import 'package:application/di/di.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/stores/business_logic/shop_store.dart';
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
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  final ShopStore shopStore = inject();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopStore shopStore = ref.watch(injectStoreProvider());

    return DataBuilder(
      data: shopStore,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).shop)),
          body: NoScrollIndicator(
            child: CustomScrollView(
              slivers: [
                AppSliverSearchBar(context, () => appRouter.navigate(SearchRoute())),
                AppSliverSliders(banners: shopStore.banners),
                SliverSizedBox(height: 20),
                if (shopStore.offers.hasValue) AppSliverAmazingOffers(),
                //TODO: uncomment and refactor
                // AppSliverNineTiles(
                //   products: fakeProducts,
                //   title: S.of(context).mostLikedByCustomers,
                //   subtitle: S.of(context).thingsYouMightLike,
                //   linkLabel: S.of(context).viewAll,
                // ),
                // AppSliverSingleBanner(imageUrl: fakeSale2),
                // SliverSizedBox(height: 30),
                // AppSliverMostPopular(products: fakeProducts, title: S.of(context).topSales),
                // AppSliverDoubleBanner(imageUrls: fakeSales),
                // AppSliverHorizontalProductsList(
                //   products: fakeProducts,
                //   title: S.of(context).newItems,
                //   linkLabel: S.of(context).viewAll,
                //   onLinkClicked: () {},
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
