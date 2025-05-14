import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/header_widget.dart';
import 'package:class_a_ec/features/product/data/models/category_model.dart';
import 'package:class_a_ec/features/product/presentation/widgets/product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../widgets/filters_by_item_group_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderWidget(
            title: 'Category title'.tr(),
            isBackButtonVisible: true,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BodyContainer(
              child: Column(
                children: [
                  const Gutter(),
                  const FiltersByItemGroupWidget(),
                  // CustomSearchContainer(onChanged: (value) {}),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 16,
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.75,
                        ),
                        padding: EdgeInsets.zero,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return const ProductCard();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
