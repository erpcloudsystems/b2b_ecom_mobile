import 'package:class_a_ec/core/global/shared_preference_provider.dart';
import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/constance.dart';
import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:class_a_ec/core/utils/custom_elevated_medium_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isFirstTimeUser =
      SingletonSharedPreferences.instance.getBool(isFirstTimeUserKey) ?? true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagePaths.logo,
              height: 250.h,
            ),
            const Gutter(),
            SizedBox(
              width: 295.w,
              child: Text(
                StringsManager.companyDescription,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const GutterExtraLarge(),
            CustomElevatedMediumButton(
              title: StringsManager.login,
              onPressed: () {
                if (true) {
                  context.pushReplacementNamed(AppRoutes.onboardingScreen);
                } else {
                  context.pushReplacementNamed(AppRoutes.loginScreen);
                }
              },
              backgroundColor: ColorsManager.secondaryColor.withOpacity(0.7),
            ),
            const GutterSmall(),
            CustomElevatedMediumButton(
              title: StringsManager.signUp,
              onPressed: () {
                if (true) {
                  context.pushReplacementNamed(AppRoutes.onboardingScreen);
                } else {
                  context.pushReplacementNamed(AppRoutes.signUpScreen);
                }
              },
              backgroundColor: ColorsManager.mainColor.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }
}
