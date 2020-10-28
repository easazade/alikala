import 'package:alikala/core/constants.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:footprint/footprint.dart';

class AppBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AppBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.TEXT_MED,
      unselectedItemColor: AppColors.TEXT_LIGHT,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 12),
      onTap: (itemIndex) {
        Footprint.log(itemIndex);
        setState(() {
          _selectedIndex = itemIndex;
        });
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
    );
  }
}
