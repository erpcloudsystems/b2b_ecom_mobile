import 'package:class_a_ec/core/global/enums.dart';
import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/utils/custom_elevated_tiny_button.dart';
import 'package:class_a_ec/features/order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: ColorsManager.mainColor.withAlpha(
            127,
          ),
        ),
        const GutterTiny(),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                orderModel.image,
                fit: BoxFit.cover,
                width: 71,
                height: 108,
              ),
            ),
            const Gutter(),
            Flexible(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderModel.title,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const GutterSmall(),
                      Text(
                        orderModel.date,
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                      const GutterTiny(),
                      CustomElevatedTinyButton(
                        title: 'Cancel order',
                        onPressed: () {},
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderModel.price,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorsManager.mainColor,
                            ),
                      ),
                      const GutterSmall(),
                      Text(
                        '${orderModel.itemsNumber} items',
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                      const GutterTiny(),
                      CustomElevatedTinyButton(
                        title: 'Track driver',
                        onPressed: () {},
                        elevatedButtonStyle:
                            CustomElevatedButtonStyle.secondary,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
