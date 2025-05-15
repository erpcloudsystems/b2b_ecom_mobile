import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/features/product/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class CompleteOrderItemList extends StatelessWidget {
  const CompleteOrderItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringsManager.completeTheOrder,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white)),
        const Gutter(),
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const SizedBox(
                width: 200,
                child: ProductCard(inCart: true),
              );
            },
            separatorBuilder: (context, index) {
              return const Gutter();
            },
          ),
        ),
      ],
    );
  }
}
