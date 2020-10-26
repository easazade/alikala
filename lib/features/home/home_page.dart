import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/app_sliver_amazing_deals.dart';
import 'package:alikala/widgets/app_sliver_sliders.dart';
import 'package:alikala/widgets/app_sliver_search_bar.dart';
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
              showInfoToast('Information');
            }),
            AppSliverSliders(images: fakeSales),
            SliverSizedBox(height:20),
            AppSliverAmazingDeals(amazingDeals: fakeAmazingDeals),
            SliverSizedBox(height:30),
          ],
        ),
      ),
    );
  }
}
