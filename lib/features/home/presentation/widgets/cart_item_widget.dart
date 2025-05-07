import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/features/product/presentation/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                ImagePaths.bestSeller,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const GutterSmall(),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Strawberry Shake',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    '\$2.99',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '29/11/24',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    '15:00',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Row(
                    children: [
                      CircleButton(
                        size: 16,
                        backGroundColor: Colors.white,
                        icon: Icons.remove,
                        onPressed: () {},
                        enabled: false,
                        iconColor: ColorsManager.mainColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Text(
                          '1',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                      CircleButton(
                        size: 16,
                        backGroundColor: Colors.white,
                        icon: Icons.add,
                        onPressed: () {},
                        iconColor: ColorsManager.mainColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gutter(),
        const Divider(),
        const Gutter(),
      ],
    );
  }
}
