import 'package:alikala/core/app.dart';
import 'package:alikala/core/constants.dart';
import 'package:alikala/core/navigation.gr.dart';
import 'package:alikala/di/di.dart';
import 'package:alikala/gen/assets.gen.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:alikala/widgets/app_icon_button.dart';
import 'package:alikala/widgets/app_section_separator.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIconButton(
                        icon: Icon(FeatherIcons.settings),
                        onTap: () {
                          appRouter.navigate(SettingsRoute());
                        },
                      ),
                      AppIconButton(
                        icon: Icon(FeatherIcons.bell),
                        onTap: () {
                          //TODO: remove this later
                          profileStore.init();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                // building profile store with buildWhen
                WhenDataBuilder(
                  data: profileStore,
                  observe: true,
                  onAvailable: (context, store) => Text(
                    store.username.value,
                    textAlign: TextAlign.center,
                    style: TextStyles.dark_20_w700.copyWith(height: 1),
                  ),
                  onLoading: (_, __) => Text('loading'),
                  onError: (_, store) => Text(store.error.message),
                  orElse: (_, __) => Text('else clause'),
                ),

                /// building profileStore using build
                DataBuilder(
                  data: profileStore,
                  observe: true,
                  builder: (context, store) {
                    if (store.isFetching) {
                      return Text('fetching');
                    } else if (store.isLoading) {
                      return Text('loading');
                    } else if (store.isAvailable) {
                      return Text(
                        store.username.value,
                        textAlign: TextAlign.center,
                        style: TextStyles.dark_20_w700.copyWith(height: 1),
                      );
                    } else {
                      return Text('what username :(');
                    }
                  },
                ),
                //directly using StoreConsumer to build the shopStore
                DataBuilder(
                  data: shopStore,
                  observe: true,
                  builder: (context, store) {
                    return WhenDataBuilder(
                      data: shopStore.shopName,
                      onAvailable: (context, data) => Text('${data.value} &&'),
                      onLoading: (context, data) => CircularProgressIndicator(color: Colors.red),
                    );
                  },
                ),

                Text('09117158746', textAlign: TextAlign.center, style: TextStyles.light_14),
                SizedBox(height: 15),
                Image.asset(Assets.images.coinDash.assetName, width: 80),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: '5 ', style: TextStyles.dark_12_w500.copyWith(fontFamily: FontFamily.estedadFD)),
                      TextSpan(text: 'امتیاز', style: TextStyles.light_12.copyWith(fontFamily: FontFamily.estedadFD)),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                AppSectionSeparator(),
                SizedBox(height: 15),
                _createMenuButton(
                  icon: FeatherIcons.heart,
                  label: 'لیست مورد علاقه‌ها',
                  onTap: () {
                    appRouter.navigate(FavoritesRoute());
                  },
                ),
                _createMenuButton(icon: Icons.comment_outlined, label: 'نقد و نظرات', onTap: () {}),
                _createMenuButton(
                    icon: Icons.directions_outlined,
                    label: 'آدرس ها',
                    onTap: () {
                      appRouter.navigate(AddressRoute());
                    }),
                _createMenuButton(icon: Icons.person_outline_outlined, label: 'اطلاعات حساب کاربری', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createMenuButton({
    required IconData icon,
    required String label,
    required Null Function() onTap,
    Color? labelColor,
    bool hasDivider = true,
  }) {
    var color = labelColor ?? AppColors.TEXT_MED;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, size: 26, color: color),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            label,
                            style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w500),
                          ),
                          Icon(CupertinoIcons.forward, size: 20, color: Colors.grey[400]),
                        ],
                      ),
                      if (hasDivider) ...[
                        SizedBox(height: 6),
                        Divider(),
                      ]
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
