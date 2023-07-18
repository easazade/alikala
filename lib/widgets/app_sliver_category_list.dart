import 'package:alikala/core/constants.dart';
import 'package:alikala/data/entities.dart';
import 'package:alikala/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

import 'app_network_image.dart';

class AppSliverCategoryList extends StatelessWidget {
  final Category category;
  final List<Category> subCategories;

  const AppSliverCategoryList({
    required this.category,
    required this.subCategories,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) => true,
        child: Container(
          height: 270,
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(category.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    Row(
                      children: [
                        Text(S.of(context).viewAll,
                            style:
                                TextStyle(fontSize: 13, color: AppColors.THEME_ACCENT_2, fontWeight: FontWeight.w500)),
                        Icon(CupertinoIcons.forward, color: AppColors.THEME_ACCENT_2, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  itemBuilder: (context, position) => _createProductItem(subCategories[position]),
                  itemCount: subCategories.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createProductItem(Category subCategory) {
    return Container(
      width: 120,
      height: 270,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.BG,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AppNetworkImage(imageUrl: subCategory.image, width: 110, height: 120),
          ),
          SizedBox(height: 8),
          Text(
            subCategory.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: AppColors.TEXT_LIGHT_2, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            '+${subCategory.productsEstimate} ${S.current.items}',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10, color: AppColors.TEXT_LIGHT, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
