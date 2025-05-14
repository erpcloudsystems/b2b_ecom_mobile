import 'package:flutter/material.dart';

import 'circle_button.dart';

class QtyWidget extends StatelessWidget {
  const QtyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
