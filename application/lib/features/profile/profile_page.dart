import 'package:application/core/app.dart';
import 'package:application/core/constants.dart';
import 'package:application/core/navigation.gr.dart';
import 'package:application/di/di.dart';
import 'package:application/gen/assets.gen.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/stores/business_logic/auth_store.dart';
import 'package:application/stores/business_logic/profile_store.dart';
import 'package:application/widgets/app_icon_button.dart';
import 'package:application/widgets/app_section_separator.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final profileStore = ref.watch(injectStoreProvider<ProfileStore>());
    final authStore = ref.watch(injectStoreProvider<AuthStore>());

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
                        onTap: () => appRouter.navigate(SettingsRoute()),
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
                  onValue: (context, store) => Text(
                    store.username.value,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall?.copyWith(height: 1),
                  ),
                  onOperate: (_, __) => Text('loading'),
                  onError: (_, store) => Text(store.error.message),
                  orElse: (_, __) => Text('else clause'),
                ),

                /// building profileStore using build
                DataBuilder(
                  data: profileStore,
                  builder: (context, store) {
                    if (store.isOperating) {
                      return Text(store.operation.name);
                    } else if (store.hasValue) {
                      return Text(
                        store.username.value,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall?.copyWith(height: 1),
                      );
                    } else {
                      return Text('what username :(');
                    }
                  },
                ),
                //directly using StoreConsumer to build the shopStore
                // DataBuilder(
                //   data: shopStore,
                //   builder: (context, store) {
                //     return WhenDataBuilder(
                //       data: shopStore.shopName,
                //       onValue: (context, data) => Text('${data.value} &&'),
                //       onOperate: (context, data) => CircularProgressIndicator(color: Colors.red),
                //     );
                //   },
                // ),

                Text(
                  '09117158746',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium?.copyWith(color: AppColors.textLight),
                ),
                SizedBox(height: 15),
                Image.asset(Assets.images.coinDash.path, width: 80),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: '5 ', style: theme.textTheme.labelSmall),
                      TextSpan(text: S.of(context).points, style: theme.textTheme.labelSmall),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                AppSectionSeparator(),
                SizedBox(height: 15),
                _createMenuButton(
                  icon: FeatherIcons.heart,
                  label: S.of(context).favoritesList,
                  onTap: () {
                    appRouter.navigate(FavoritesRoute());
                  },
                ),
                _createMenuButton(
                  icon: Icons.comment_outlined,
                  label: S.of(context).comments,
                  onTap: () {},
                ),
                _createMenuButton(
                  icon: Icons.directions_outlined,
                  label: S.of(context).addresses,
                  onTap: () {
                    appRouter.navigate(AddressRoute());
                  },
                ),
                _createMenuButton(
                  icon: Icons.person_outline_outlined,
                  label: S.of(context).accountDetails,
                  onTap: () {},
                ),
                if (authStore.isUserAuthenticated)
                  _createMenuButton(
                    icon: Icons.logout,
                    label: S.of(context).logout,
                    onTap: () => authStore.logout(),
                  ),
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
    required void Function() onTap,
    Color? labelColor,
    bool hasDivider = true,
  }) {
    var color = labelColor ?? AppColors.textMed;
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
