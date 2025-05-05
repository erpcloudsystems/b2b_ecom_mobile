import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/features/home/presentation/widgets/best_seller_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: 5,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const BestSellerItemWidget(
          imagePath: ImagePaths.bestSeller,
          price: 50.0,
        );
      },
    );
  }
}
