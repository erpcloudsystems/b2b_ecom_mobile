import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';

class BestSellerItemWidget extends StatelessWidget {
  const BestSellerItemWidget(
      {super.key, required this.imagePath, required this.price});
  final String imagePath;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: ColorsManager.secondaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '\$$price',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
