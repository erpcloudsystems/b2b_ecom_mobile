import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'change_language_widget.dart';
import 'custom_drawer_list_tile.dart';
import 'user_header_widget.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.secondaryColor.withAlpha(500),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 32.h,
          horizontal: 32.w,
        ),
        child: Column(
          children: [
            const Gutter.extraLarge(),
            const UserHeaderWidget(),
            const Gutter(),
            CustomDrawerListTile(
              title: StringsManager.myOrders,
              leadingIcon: FontAwesomeIcons.bagShopping,
              onTap: () {
                context.push(AppRoutes.orderScreen);
              },
            ),
            const Divider(),
            CustomDrawerListTile(
              title: StringsManager.myProfile,
              leadingIcon: FontAwesomeIcons.solidUser,
            ),
            const Divider(),
            CustomDrawerListTile(
              title: StringsManager.myAddresses,
              leadingIcon: FontAwesomeIcons.locationDot,
            ),
            const Divider(),
            CustomDrawerListTile(
              title: StringsManager.contactUs,
              leadingIcon: FontAwesomeIcons.phone,
            ),
            const Divider(),
            CustomDrawerListTile(
              title: StringsManager.language,
              // Switch language icon
              leadingIcon: FontAwesomeIcons.globe,
              onTap: () => showModalBottomSheet(
                context: context,
                showDragHandle: true,
                builder: (context) {
                  return const ChangeLanguageWidget();
                },
              ),
            ),
            const Divider(),
            const Gutter(),
            CustomDrawerListTile(
              title: StringsManager.logout,
              leadingIcon: FontAwesomeIcons.rightFromBracket,
            ),
          ],
        ),
      ),
    );
  }
}
