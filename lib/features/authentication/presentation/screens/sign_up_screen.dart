import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:class_a_ec/core/utils/custom_elevated_medium_button.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/facility_form.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/header_widget.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/personal_info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int currentStep = 1;
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
                    Text(
                      currentStep == 1
                          ? StringsManager.personalInformation
                          : StringsManager.facilityInformation,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorsManager.mainColor,
                          ),
                    ),
                    const Gutter.large(),
                    if (currentStep == 1) const PersonalInfoForm(),
                    if (currentStep == 2) const FacilityForm(),
                    const Gutter.large(),
                    if (currentStep == 2)
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
                      title: currentStep == 1
                          ? StringsManager.next
                          : StringsManager.signUp,
                      onPressed: () {
                        if (currentStep == 1) {
                          showBottomSheet(
                              context: context,
                              showDragHandle: true,
                              builder: (context) {
                                return const OtpVerifyWidget(
                                  password: '',
                                  phone: '01023456789',
                                );
                              });
                          setState(() {
                            currentStep = 2;
                          });
                        } else {
                          context.pushReplacementNamed(AppRoutes.loginScreen);
                        }
                      },
                    ),
                    const Gutter(),
                    if (currentStep == 2)
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
