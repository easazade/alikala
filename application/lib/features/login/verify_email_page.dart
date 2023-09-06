import 'package:application/core/app.dart';
import 'package:application/core/constants.dart';
import 'package:application/core/navigation.gr.dart';
import 'package:application/di/di.dart';
import 'package:application/gen/assets.gen.dart';
import 'package:application/gen/fonts.gen.dart';
import 'package:application/generated/l10n.dart';
import 'package:application/stores/auth_store.dart';
import 'package:application/stores/custom_operations.dart';
import 'package:application/utils/utils_functions.dart';
import 'package:application/widgets/app_form_field.dart';
import 'package:application/widgets/app_form_long_btn.dart';
import 'package:application/widgets/util/app_error_widget.dart';
import 'package:application/widgets/util/no_scroll_glow.dart';
import 'package:application/widgets/util/unfocus_current_focus_widget.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class VerifyEmailPage extends ConsumerStatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  ConsumerState<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends ConsumerState<VerifyEmailPage> {
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

    final authStore = ref.watch(injectStoreProvider<AuthStore>());

    return Scaffold(
      body: NoScrollIndicator(
        child: Unfocus(
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
                  if (authStore.hasError && authStore.error.cause == Ops.verify)
                    AppErrorWidget(failure: authStore.error),
                  SizedBox(height: 20),
                  AppFormField(S.of(context).enterVerificationCode, (input) {
                    verificationCode = input;
                  }),
                  SizedBox(height: 20),
                  AppFormLongButton(
                    S.of(context).verify,
                    () async {
                      await authStore.verifyAndSignUp(verificationCode);
                      if (authStore.isUserAuthenticated) {
                        authStore.error = null;
                        appRouter.navigate(LoginRoute());
                      }
                    },
                    loading: authStore.isOperating,
                  ),
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
