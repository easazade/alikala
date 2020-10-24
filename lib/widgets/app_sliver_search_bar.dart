import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alikala/core/constants.dart';

class AppSliverSearchBar extends SliverPersistentHeader {
  AppSliverSearchBar(BuildContext context)
      : super(
          pinned: true,
          floating: false,
          delegate: AppSliverSearchBarDelegate(context),
        );
}

class AppSliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  BuildContext context;

  AppSliverSearchBarDelegate(this.context);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.context = context;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(0, 1), blurRadius: 1)],
      ),
      child: SafeArea(
        bottom: false,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 12),
                  Icon(FeatherIcons.search, size: 28, color: AppColors.TEXT_MED),
                  SizedBox(width: 20),
                  Text('جستجو در', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[500])),
                  SizedBox(width: 6),
                  Text('علی‌کالا', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.THEME_ACCENT)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => (MediaQuery.of(context).padding.top > 20) ? 120 : 90;

  @override
  double get minExtent => (MediaQuery.of(context).padding.top > 20) ? 120 : 90;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
