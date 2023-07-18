import 'package:alikala/core/constants.dart';
import 'package:alikala/features/cart/cart_page.dart';
import 'package:alikala/features/categories/categories_page.dart';
import 'package:alikala/features/home/home_page.dart';
import 'package:alikala/features/profile/profile_page.dart';
import 'package:alikala/generated/l10n.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: AppColors.TEXT_DARK,
        inactiveColor: AppColors.TEXT_LIGHT,
        iconSize: 20,
        border: Border.all(color: Colors.grey[100]!),
        items: [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.menu),
            label: S.of(context).categories,
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.shoppingCart),
            label: S.of(context).shoppingCart,
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user),
            label: S.of(context).profile,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return HomePage();
          case 1:
            return CategoriesPage();
          case 2:
            return CartPage();
          case 3:
            return ProfilePage();
        }
        throw Exception('there is no page for this index in tabBuilder in main_screen.dart');
      },
    );
  }
}
