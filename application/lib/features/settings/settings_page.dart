import 'package:application/core/constants.dart';
import 'package:application/gen/fonts.gen.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/utils/utils_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(S.of(context).settings, style: theme.textTheme.bodyLarge),
        actions: [
          // IconButton(icon: Icon(FeatherIcons.x), onPressed: Navigator.of(context).pop),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                createSettingItem(
                    label: S.of(context).faq, icon: Icons.question_answer, onTap: () => showInfoToast('FAQ')),
                createSettingItem(label: S.of(context).callUs, icon: Icons.call, onTap: () => showInfoToast('Call Us')),
                createSettingItem(
                    label: S.of(context).rateAlikalaApp, icon: Icons.star_rate, onTap: () => showInfoToast('Rate Us')),
                createSettingItem(
                  label: S.of(context).logout,
                  labelColor: theme.primaryColor,
                  hasDivider: false,
                  icon: Icons.logout,
                  onTap: () => showInfoToast('Logout'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 0.95),
            child: _createLogoAndVersionArea(context),
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
    var color = labelColor ?? AppColors.textMed;
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

  Widget _createLogoAndVersionArea(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).alikala,
          style: TextStyle(
            fontFamily: FontFamily.opensans,
            color: theme.primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 5),
        Text(
          '${S.of(context).appVersion}: 1.0.0',
          style: TextStyle(fontSize: 10, fontFamily: FontFamily.opensans, color: AppColors.textLight2),
        ),
      ],
    );
  }
}
