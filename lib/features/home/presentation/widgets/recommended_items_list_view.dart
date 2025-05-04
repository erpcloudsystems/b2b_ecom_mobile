import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/features/home/presentation/widgets/recommended_item_widget.dart';
import 'package:flutter/material.dart';

class RecommendedItemsListView extends StatelessWidget {
  const RecommendedItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(
            right: 10,
          ),
          child: RecommendedItemWidget(
            imagePath: ImagePaths.bestSeller,
          ),
        );
      },
    );
  }
}
