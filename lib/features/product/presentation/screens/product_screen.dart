import 'package:class_a_ec/core/utils/custom_search_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/header_widget.dart';
import 'package:class_a_ec/features/product/data/models/category_model.dart';
import 'package:class_a_ec/features/product/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HeaderWidget(
            title: 'Category title',
            isBackButtonVisible: true,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BodyContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 22,
                ),
                child: Column(
                  children: [
                    CustomSearchContainer(onChanged: (value) {}),
                    const GutterLarge(),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const ProductCard();
                        },
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
