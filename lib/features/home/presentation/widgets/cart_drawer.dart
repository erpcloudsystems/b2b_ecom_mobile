import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/utils/custom_divider.dart';
import 'package:class_a_ec/core/utils/custom_elevated_medium_button.dart';
import 'package:class_a_ec/features/home/presentation/widgets/cart_info_row.dart';
import 'package:class_a_ec/features/home/presentation/widgets/cart_item_widget.dart';
import 'package:class_a_ec/features/home/presentation/widgets/empty_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.secondaryColor.withAlpha(500),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 32.h,
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            const Gutter.extraLarge(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.cartShopping,
                    color: ColorsManager.mainColor,
                  ),
                ),
                Text(
                  StringsManager.cart,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            const GutterLarge(),
            const CustomDivider(),
            const Gutter(),
            if (true) ...[
              Row(
                children: [
                  Text(
                    StringsManager.youHave,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const GutterTiny(),
                  Text(
                    '2',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const GutterTiny(),
                  Text(
                    StringsManager.itemsInTheCart,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const Gutter(),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const CartItemWidget();
                },
              ),
              const GutterLarge(),
              CartInfoRow(
                title: StringsManager.total,
                value: '20.00 ${StringsManager.egp}',
              ),
              CartInfoRow(
                title: StringsManager.minimumOrder,
                value: '20.00 ${StringsManager.egp}',
              ),
              CartInfoRow(
                title: StringsManager.earnedPoints,
                value: '20',
                color: ColorsManager.mainColor,
              ),
              const GutterExtraLarge(),
              CustomElevatedMediumButton(
                title: StringsManager.checkout,
                onPressed: () {},
              )
            ],
            if (false) const EmptyCartWidget(),
          ],
        ),
      ),
    );
  }
}
