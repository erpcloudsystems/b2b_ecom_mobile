import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/utils/custom_divider.dart';
import 'package:class_a_ec/core/utils/custom_elevated_medium_button.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/product/presentation/widgets/custom_choice_chip.dart';
import 'package:class_a_ec/features/product/presentation/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../widgets/qty_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30.h),
            alignment: Alignment.topCenter,
            color: ColorsManager.secondaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: ColorsManager.white,
                  ),
                ),
                const Spacer(),
                Text(
                  'سانتيه بوكس التوفير',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorsManager.white,
                      ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_rounded,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BodyContainer(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: 32.h,
                  horizontal: 36.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: Image.network(
                        ImagePaths.product,
                        width: double.infinity,
                        height: 229.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const GutterLarge(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '20.00 ${StringsManager.egp}',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        const QtyWidget(),
                      ],
                    ),
                    const CustomDivider(),
                    const GutterTiny(),
                    Text(
                      'سانتيه بوكس التوفير',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Marinated in a rich blend of herbs and spices, then grilled to perfection, served with a side of zesty dipping sauce.'
                          .tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Gutter(),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      alignment: WrapAlignment.start,
                      children: [
                        _hintWidget('2,500 الحد الادنى للطلبيه'),
                        _hintWidget('حد الادنى للكميه x3'),
                        _hintWidget('اقصى كميه x5 كرتون'),
                      ],
                    ),
                    const Gutter(),
                    Text(
                      StringsManager.unitOfMeasure,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    CustomChoiceChip(
                      values: [
                        StringsManager.piece,
                        StringsManager.box,
                        StringsManager.litre
                      ],
                    ),
                    const GutterLarge(),
                    Builder(builder: (context) {
                      return Center(
                        child: CustomElevatedMediumButton(
                          title: StringsManager.addToCart,
                          onPressed: () {
                            showBottomSheet(
                                context: context,
                                showDragHandle: true,
                                builder: (context) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Gutter(),
                                      const Center(
                                        child: SizedBox(
                                          height: 250,
                                          width: 200,
                                          child: ProductCard(),
                                        ),
                                      ),
                                      const QtyWidget(),
                                      const Gutter(),
                                      CustomElevatedMediumButton(
                                        title: StringsManager.completeTheOrder,
                                        onPressed: () {
                                          context.pop();
                                        },
                                      ),
                                      const Gutter.extraLarge(),
                                    ],
                                  );
                                });
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hintWidget(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorsManager.grey.withAlpha(500),
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            FontAwesomeIcons.coins,
            color: ColorsManager.grey,
            size: 14,
          ),
          const GutterTiny(),
          Text(
            hint,
            style: const TextStyle(
              color: ColorsManager.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
