import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/custom_drawer_list_tile.dart';
import '../widgets/user_header_widget.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.secondaryColor.withAlpha(500),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 32.h,
          horizontal: 32.w,
        ),
        child: const Column(
          children: [
            Gutter.extraLarge(),
            UserHeaderWidget(),
            Gutter(),
            CustomDrawerListTile(
              title: 'My Order',
              leadingIcon: FontAwesomeIcons.bagShopping,
            ),
            Divider(),
            CustomDrawerListTile(
              title: 'My Profile',
              leadingIcon: FontAwesomeIcons.solidUser,
            ),
            Divider(),
            CustomDrawerListTile(
              title: 'My Addresses',
              leadingIcon: FontAwesomeIcons.locationDot,
            ),
            Divider(),
            CustomDrawerListTile(
              title: 'Contact Us',
              leadingIcon: FontAwesomeIcons.phone,
            ),
            Divider(),
            CustomDrawerListTile(
              title: 'Log Out',
              leadingIcon: FontAwesomeIcons.rightFromBracket,
            ),
          ],
        ),
      ),
    );
  }
}
