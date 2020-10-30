import 'package:alikala/core/constants.dart';
import 'package:alikala/features/cart/cart_page.dart';
import 'package:alikala/features/categories/categories_page.dart';
import 'package:alikala/features/home/home_page.dart';
import 'package:alikala/features/profile/profile_page.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          activeColor: AppColors.TEXT_DARK,
          inactiveColor: AppColors.TEXT_LIGHT,
          iconSize: 20,
          border: Border.all(color: Colors.grey[100]),
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
          ]),
      resizeToAvoidBottomInset: false,
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return HomePage();
            break;
          case 1:
            return CategoriesPage();
            break;
          case 2:
            return CartPage();
            break;
          case 3:
            return ProfilePage();
            break;
        }
        throw Exception('there is no page for this index');
      },
    );
  }
}
