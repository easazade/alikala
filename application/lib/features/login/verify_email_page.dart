import 'package:application/core/constants.dart';
import 'package:application/di/di.dart';
import 'package:application/gen/assets.gen.dart';
import 'package:application/gen/fonts.gen.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/utils/utils_functions.dart';
import 'package:application/widgets/app_form_field.dart';
import 'package:application/widgets/app_form_long_btn.dart';
import 'package:application/widgets/util/unfocus_current_focus_widget.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({
    required this.email,
    super.key,
  });

  final String email;

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  String? verificationCode;

  final EmailAuthController emailAuthController = inject();

  final textSpanStyle = TextStyle(color: AppColors.textDark, fontSize: 11, fontFamily: FontFamily.opensans);

  final linkTextSpanStyle = TextStyle(
    color: AppColors.hyperlink,
    fontSize: 11,
    fontFamily: FontFamily.opensans,
    decoration: TextDecoration.underline,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
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
                    S.of(context).alikala,
                    style: TextStyle(
                      fontFamily: FontFamily.opensans,
                      color: theme.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.08,
                    child: Image.asset(Assets.images.splashLogoAccentColor.path),
                  ),
                  SizedBox(height: 64),
                  Row(children: [
                    Expanded(
                      child: Text(
                        S.of(context).toLoginYouNeedToEnterEmailOrMobileNumber,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(width: 60),
                  ]),
                  SizedBox(height: 20),
                  AppFormField(S.of(context).enterVerificationCode, (input) {
                    verificationCode = input;
                  }),
                  SizedBox(height: 20),
                  AppFormLongButton(S.of(context).verify, () async {
                    if (verificationCode != null) {
                      final result =
                          await emailAuthController.validateAccount(widget.email, verificationCode!).sealed();
                      if (result.isSuccessful) {
                        showSuccessToast('Verified account');
                      } else {
                        showWarningToast('Could not verify account');
                      }
                    }
                  }),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: S.of(context).byLogingInToAlikala, style: textSpanStyle),
                        TextSpan(
                          text: S.of(context).rulesAndAgreements,
                          style: linkTextSpanStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => showAppToastWithAction(context, S.of(context).rulesAndAgreements, action: (v) {}),
                        ),
                        TextSpan(text: S.of(context).usingAlikalaServices, style: textSpanStyle),
                        TextSpan(
                          text: S.of(context).privacyPolicy,
                          style: linkTextSpanStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => showAppToastWithAction(context, S.of(context).rulesAndAgreements, action: (v) {}),
                        ),
                        TextSpan(text: S.of(context).acceptIt, style: textSpanStyle),
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
