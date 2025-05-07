import 'package:class_a_ec/core/extensions/string_extension.dart';
import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/core/utils/custom_divider.dart';
import 'package:class_a_ec/core/utils/custom_elevated_medium_button.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/product/presentation/widgets/circle_button.dart';
import 'package:class_a_ec/features/product/presentation/widgets/custom_choice_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
                Text(
                  'Mexican Appetizer',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorsManager.white,
                      ),
                ),
                const GutterExtraLarge(),
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
                      child: Image.asset(
                        ImagePaths.offer,
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
                          '\$20.00',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        Row(
                          children: [
                            CircleButton(
                              icon: Icons.remove,
                              onPressed: () {},
                              enabled: false,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                '1',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            CircleButton(
                              icon: Icons.add,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    const CustomDivider(),
                    const GutterTiny(),
                    Text(
                      'Mexican appetizer',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Marinated in a rich blend of herbs and spices, then grilled to perfection, served with a side of zesty dipping sauce.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Gutter(),
                    Text(
                      'Unit of Measure'.hardCoded,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const CustomChoiceChip(
                      values: ['Piece', 'Box', 'Litre'],
                    ),
                    const GutterLarge(),
                    Center(
                      child: CustomElevatedMediumButton(
                        title: 'Add to cart'.hardCoded,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
