import 'package:alikala/core/constants.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('تنظیمات', style: TextStyles.dark_18_w700),
        actions: [
          IconButton(icon: Icon(FeatherIcons.x), onPressed: Navigator.of(context).pop),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                createSettingItem(
                    label: 'پرسش‌های متداول', icon: Icons.question_answer, onTap: () => showInfoToast('QA')),
                createSettingItem(label: 'تماس با ما', icon: Icons.call, onTap: () => showInfoToast('Call Us')),
                createSettingItem(
                    label: 'امتیاز به اپلیکیشن علی‌کالا', icon: Icons.star_rate, onTap: () => showInfoToast('Rate Us')),
                createSettingItem(
                  label: 'خروج از حساب کاربری',
                  labelColor: AppColors.THEME_ACCENT,
                  hasDivider: false,
                  icon: Icons.logout,
                  onTap: () => showInfoToast('Logout'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 0.95),
            child: _createLogoAndVersionArea(),
          ),
        ],
      ),
    );
  }

  static Widget createSettingItem({
    required IconData icon,
    required String label,
    required void Function() onTap,
    Color? labelColor,
    bool hasDivider = true,
  }) {
    var color = labelColor ?? AppColors.TEXT_MED;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
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
    );
  }

  Widget _createLogoAndVersionArea() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'AliKala',
          style: TextStyle(
            fontFamily: FontFamily.exo2,
            color: AppColors.THEME_ACCENT,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'App Version: 1.0.0',
          style: TextStyle(fontSize: 10, fontFamily: FontFamily.estedad, color: AppColors.TEXT_LIGHT_2),
        ),
      ],
    );
  }
}
