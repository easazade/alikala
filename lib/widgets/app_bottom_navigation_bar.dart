import 'package:alikala/core/constants.dart';
import 'package:alikala/core/navigation.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBarIndex {
  static const int HOME = 0;
  static const int CATEGORIES = 1;
  static const int CART = 2;
  static const int PROFILE = 3;
}

class AppBottomNavigationBar extends StatelessWidget {
  final int _selectedIndex;

  AppBottomNavigationBar(this._selectedIndex);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.TEXT_MED,
        unselectedItemColor: AppColors.TEXT_LIGHT,
        selectedLabelStyle: TextStyle(fontSize: 11),
        unselectedLabelStyle: TextStyle(fontSize: 11),
        iconSize: 20,
        onTap: (itemIndex) {
          switch (itemIndex) {
            case 0:
              sailor.navigate(Routes.home);
              break;
            case 1:
              sailor.navigate(Routes.categories);
              break;
            case 2:
              sailor.navigate(Routes.cart);
              break;
            case 3:
              sailor.navigate(Routes.profile);
              break;
          }
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.menu),
            label: 'دسته‌بندی‌ها',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.shoppingCart),
            label: 'سبد خرید',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user),
            label: 'پروفایل',
          ),
        ],
      ),
    );
  }
}
