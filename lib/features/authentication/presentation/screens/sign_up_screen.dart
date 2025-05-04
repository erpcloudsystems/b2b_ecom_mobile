import 'package:class_a_ec/core/extensions/string_extension.dart';
import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:class_a_ec/core/utils/custom_elevated_medium_button.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/header_widget.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderWidget(
            title: 'New Account'.hardCoded,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BodyContainer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SignUpForm(),
                    const Gutter(),
                    Column(
                      children: [
                        Text('By continuing, you agree to'.hardCoded),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Terms of Use'.hardCoded,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: ColorsManager.secondaryColor,
                                  ),
                            ),
                            const GutterTiny(),
                            Text('and'.hardCoded),
                            const GutterTiny(),
                            Text(
                              'Privacy Policy'.hardCoded,
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
                      title: 'Sign Up'.hardCoded,
                      onPressed: () {},
                    ),
                    const Gutter(),
                    GestureDetector(
                      onTap: () {
                        context.pushReplacementNamed(AppRoutes.loginScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'.hardCoded),
                          const GutterTiny(),
                          Text(
                            'Login'.hardCoded,
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
