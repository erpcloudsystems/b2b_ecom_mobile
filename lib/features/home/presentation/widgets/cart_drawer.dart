import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/utils/custom_divider.dart';
import 'package:class_a_ec/core/utils/custom_elevated_medium_button.dart';
import 'package:class_a_ec/features/home/presentation/widgets/cart_info_row.dart';
import 'package:class_a_ec/features/home/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/app_routes.dart';
import '../../../product/data/models/category_model.dart';

class CartDrawer extends StatefulWidget {
  const CartDrawer({super.key});

  @override
  State<CartDrawer> createState() => _CartDrawerState();
}

class _CartDrawerState extends State<CartDrawer> {
  bool testShowProducts = false;
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
            const Gutter(),
            if (!testShowProducts) ...[
              ListTile(
                textColor: ColorsManager.red,
                iconColor: ColorsManager.red,
                title: Text(StringsManager.invalidRequest),
                leading: const Icon(Icons.close_rounded),
              ),
              Row(
                children: [
                  Text(StringsManager.minimumOrder),
                  const Gutter(),
                  Text(
                    '1000 ${StringsManager.egp}',
                  ),
                  const Gutter(),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: SliderComponentShape.noThumb,
                      overlayShape: SliderComponentShape.noOverlay,
                      activeTrackColor: ColorsManager.mainColor,
                      inactiveTrackColor: ColorsManager.grey,
                    ),
                    child: Slider(
                      min: 0,
                      max: 1000,
                      value: 250,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ],
            const Gutter(),
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
              const Gutter(),
              CartInfoRow(
                title: StringsManager.total,
                value: '20.00 ${StringsManager.egp}',
              ),
              CartInfoRow(
                title: StringsManager.cashBack,
                value: '20.00 ${StringsManager.egp}',
              ),
              CartInfoRow(
                title: StringsManager.earnedPoints,
                value: '20',
                color: ColorsManager.mainColor,
              ),
              const Gutter.large(),
              CustomElevatedMediumButton(
                title: testShowProducts
                    ? StringsManager.checkout
                    : StringsManager.completeTheOrder,
                onPressed: () {
                  if (testShowProducts) {
                  } else {
                    setState(() {
                      testShowProducts = true;
                    });
                    context.pop();
                    context.pushNamed(
                      AppRoutes.productsScreen,
                      extra: CategoryModel(),
                    );
                  }
                },
              )
            ],
            // if (false) const EmptyCartWidget(),
          ],
        ),
      ),
    );
  }
}
