import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:class_a_ec/core/utils/custom_elevated_medium_button.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/header_widget.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderWidget(
            title: StringsManager.newAccount,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BodyContainer(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 32.h,
                ),
                child: Column(
                  children: [
                    const SignUpForm(),
                    const Gutter(),
                    Column(
                      children: [
                        Text(
                          StringsManager.byContinuingYouAgreeTo,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                             StringsManager.termsOfUse,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: ColorsManager.secondaryColor,
                                  ),
                            ),
                            const GutterTiny(),
                            Text(
                              StringsManager.and,
                            ),
                            const GutterTiny(),
                            Text(
                              StringsManager.privacyPolicy,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: ColorsManager.secondaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gutter(),
                    CustomElevatedMediumButton(
                      title: StringsManager.signUp,
                      onPressed: () {
                        context.pushReplacementNamed(AppRoutes.loginScreen);
                      },
                    ),
                    const Gutter(),
                    GestureDetector(
                      onTap: () {
                        context.pushReplacementNamed(AppRoutes.loginScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringsManager.alreadyHaveAnAccount,
                          ),
                          const GutterTiny(),
                          Text(
                            StringsManager.login,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: ColorsManager.secondaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
