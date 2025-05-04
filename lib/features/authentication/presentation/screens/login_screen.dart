import 'package:class_a_ec/core/extensions/string_extension.dart';
import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:class_a_ec/core/utils/custom_elevated_medium_button.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/header_widget.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderWidget(
            title: 'Login'.hardCoded,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BodyContainer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const LoginForm(),
                    const Gutter(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget Password?'.hardCoded,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const GutterExtraLarge(),
                    Center(
                      child: CustomElevatedMediumButton(
                        title: 'Login'.hardCoded,
                        onPressed: () {
                          context.pushReplacementNamed(AppRoutes.homeScreen);
                        },
                      ),
                    ),
                    const GutterLarge(),
                    GestureDetector(
                      onTap: () {
                        context.pushReplacementNamed(AppRoutes.signUpScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?'.hardCoded,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const GutterTiny(),
                          Text(
                            'Sign Up'.hardCoded,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: ColorsManager.mainColor,
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
