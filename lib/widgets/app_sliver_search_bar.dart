import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:alikala/core/constants.dart';
import 'package:alikala/generated/l10n.dart';

class AppSliverSearchBar extends SliverPersistentHeader {
  AppSliverSearchBar(BuildContext context, VoidCallback onTap)
      : super(
          pinned: true,
          floating: false,
          delegate: AppSliverSearchBarDelegate(context, onTap),
        );
}

class AppSliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  BuildContext context;
  final VoidCallback onTap;

  AppSliverSearchBarDelegate(this.context, this.onTap);

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
        child: GestureDetector(
          onTap: onTap,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Icon(FeatherIcons.search, size: 22, color: AppColors.TEXT_MED),
                    ),
                    SizedBox(width: 12),
                    Text(S.of(context).searchIn,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[500])),
                    SizedBox(width: 6),
                    Text(S.current.app_name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.THEME_ACCENT)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 64;

  @override
  double get minExtent => 64;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
