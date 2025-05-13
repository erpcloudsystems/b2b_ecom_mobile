import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:class_a_ec/core/router/route_services.dart';
import 'package:class_a_ec/core/utils/custom_elevated_medium_button.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/header_widget.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderWidget(
            title: StringsManager.login,
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
                    Text(
                      StringsManager.welcome,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const GutterLarge(),
                    const LoginForm(),
                    const Gutter(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        StringsManager.forgetPassword,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox.adaptive(
                            value: isRememberMe,
                            onChanged: (value) {
                              setState(() {
                                isRememberMe = value ?? false;
                              });
                            },
                            side: const BorderSide(
                              width: 1,
                              color: ColorsManager.mainColor,
                            ),
                            activeColor: ColorsManager.mainColor,
                          ),
                        ),
                        Text(
                          StringsManager.rememberMe,
                        ),
                      ],
                    ),
                    const GutterExtraLarge(),
                    Center(
                      child: CustomElevatedMediumButton(
                        title: StringsManager.login,
                        onPressed: () {
                          context.pushReplacementNamed(AppRoutes.homeScreen);
                        },
                      ),
                    ),
                    const GutterLarge(),
                    GestureDetector(
                      onTap: () {
                        RoutesService.pushReplacementNamed(
                            context: context, location: AppRoutes.signUpScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringsManager.doNotHaveAnAccount,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const GutterTiny(),
                          Text(
                            StringsManager.signUp,
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
