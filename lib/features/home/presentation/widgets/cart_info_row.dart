import 'package:flutter/material.dart';

class CartInfoRow extends StatelessWidget {
  const CartInfoRow(
      {super.key, required this.title, required this.value, this.color});
  final String title;
  final String value;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: color ?? Colors.white,
              ),
        ),
        const Spacer(),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: color ?? Colors.white,
              ),
        ),
      ],
    );
  }
}
