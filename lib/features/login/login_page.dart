import 'package:alikala/core/constants.dart';
import 'package:alikala/gen/assets.gen.dart';
import 'package:alikala/gen/fonts.gen.dart';
import 'package:alikala/utils/utils_functions.dart';
import 'package:alikala/widgets/app_form_field.dart';
import 'package:alikala/widgets/app_form_long_btn.dart';
import 'package:alikala/widgets/util/unfocus_current_focus_widget.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final textSpanStyle = TextStyle(color: AppColors.TEXT_DARK, fontSize: 11, fontFamily: FontFamily.estedadFD);
  final linkTextSpanStyle = TextStyle(
    color: AppColors.HYPER_LINK,
    fontSize: 11,
    fontFamily: FontFamily.estedadFD,
    decoration: TextDecoration.underline,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowGlow();
          return false;
        },
        child: RemoveFocusOnTouchOutsideFocusedWidget(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(FeatherIcons.settings),
                      Icon(FeatherIcons.x),
                    ],
                  ),
                  SizedBox(height: 32),
                  Text(
                    'AliKala',
                    style: TextStyle(
                      fontFamily: FontFamily.exo2,
                      color: AppColors.THEME_ACCENT,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.08,
                    child: Image.asset(Assets.images.splashLogoAccentColor.assetName),
                  ),
                  SizedBox(height: 64),
                  Row(children: [
                    Expanded(
                      child: Text(
                        '???????? ???????? ?? ???? ??????????????? ???? ????????????????? ?????????? ???????????? ?? ???? ?????????? ?????? ???? ???????? ????????????.',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(width: 60),
                  ]),
                  SizedBox(height: 20),
                  AppFormField('?????????? ???????????? ???? ??????????', (input) {}),
                  SizedBox(height: 20),
                  AppFormLongButton('???????? ???? ?????????????????', () {}),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '???? ???????? ?? ???? ??????????????? ???? ????????????????? ?????? ', style: textSpanStyle),
                        TextSpan(
                          text: '?????????? ?? ????????????',
                          style: linkTextSpanStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => showAppToastWithAction(context, '???????????? ?? ????????????', action: (v) {}),
                        ),
                        TextSpan(text: ' ?????????????? ???? ?????????? ?????? ???????? ?? ', style: textSpanStyle),
                        TextSpan(
                          text: '???????????? ???????? ??????????',
                          style: linkTextSpanStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => showAppToastWithAction(context, '???????????? ?? ????????????', action: (v) {}),
                        ),
                        TextSpan(text: ' ???? ???? ???????????????????.', style: textSpanStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
