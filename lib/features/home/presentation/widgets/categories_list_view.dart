import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:class_a_ec/features/home/presentation/widgets/categories_icon_container.dart';
import 'package:class_a_ec/features/product/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.w,
        childAspectRatio: .7,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.pushNamed(
            AppRoutes.productsScreen,
            extra: CategoryModel(),
          );
        },
        child: CategoriesIconContainer(
          title: StringsManager.title,
          iconData: FontAwesomeIcons.apple,
        ),
      ),
    );
  }
}
