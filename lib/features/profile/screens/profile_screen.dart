import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/utils/custom_elevated_button.dart';
import 'package:class_a_ec/features/profile/widgets/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/strings_manager.dart';
import '../../authentication/presentation/widgets/body_container.dart';
import '../../authentication/presentation/widgets/header_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 70.h,
            child: HeaderWidget(
              title: StringsManager.myProfile,
              isBackButtonVisible: true,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BodyContainer(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 32.h,
                    horizontal: 24.w,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(
                              'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1746449396~exp=1746452996~hmac=3911f842d074bc15288d4fa7380c06c598351c2953e5b8f2835a84cfb7a3d8f2&w=996',
                              width: 130.w,
                              height: 130.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 30.w,
                              height: 30.w,
                              decoration: BoxDecoration(
                                color: ColorsManager.mainColor,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 20.sp,
                                color: ColorsManager.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gutter(),
                      const ProfileForm(),
                      const Gutter.large(),
                      CustomElevatedButton(
                          width: 200.w,
                          height: 50.h,
                          title: StringsManager.updateProfile,
                          onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
