import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.inCart = false});
  final bool inCart;

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
            child: Image.network(
              ImagePaths.product,
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
          ),
          const Gutter.small(),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'سانتيه بوكس التوفير',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '20.00 ${StringsManager.egp}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorsManager.mainColor,
                          ),
                    ),
                    if (inCart) ...[
                      const Gutter(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_shopping_cart_outlined,
                        ),
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
