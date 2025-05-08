import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.productDetailsScreen);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: Image.asset(
              ImagePaths.bestSeller,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          const Gutter(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mexican appetizer',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '\$20.00',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
