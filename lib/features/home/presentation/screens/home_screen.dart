import 'package:class_a_ec/core/extensions/string_extension.dart';
import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/header_widget.dart';
import 'package:class_a_ec/features/home/presentation/widgets/best_seller_list_view.dart';
import 'package:class_a_ec/features/home/presentation/widgets/categories_list_view.dart';
import 'package:class_a_ec/features/home/presentation/widgets/image_slider.dart';
import 'package:class_a_ec/features/home/presentation/widgets/recommended_items_list_view.dart';
import 'package:class_a_ec/features/home/presentation/widgets/search_container.dart';
import 'package:class_a_ec/features/home/presentation/widgets/svg_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderWidget(
            topPadding: 5.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchContainer(),
                    GutterLarge(),
                    SVGIconContainer(
                      iconPath: SVGIconPaths.cartIcon,
                    ),
                    GutterSmall(),
                    SVGIconContainer(
                      iconPath: SVGIconPaths.notificationIcon,
                    ),
                    GutterSmall(),
                    SVGIconContainer(
                      iconPath: SVGIconPaths.profileIcon,
                    ),
                  ],
                ),
                const Gutter(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning'.hardCoded,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      Text(
                        "Rise and shine! It's breakfast time".hardCoded,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ColorsManager.mainColor,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BodyContainer(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100.h,
                      child: const CategoriesListView(),
                    ),
                    Divider(
                      color: ColorsManager.mainColor.withValues(
                        alpha: (0.5 * 255),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Best Seller'.hardCoded,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        Text(
                          'View All'.hardCoded,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: ColorsManager.secondaryColor,
                                  ),
                        ),
                        const GutterSmall(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: ColorsManager.secondaryColor,
                          size: 15,
                        ),
                      ],
                    ),
                    const Gutter(),
                    SizedBox(
                      height: 120.h,
                      child: const BestSellerListView(),
                    ),
                    const Gutter(),
                    const ImageSlider(
                      isLocal: true,
                      viewPort: 1,
                      images: [
                        ImagePaths.offer,
                        ImagePaths.offer,
                        ImagePaths.offer,
                        ImagePaths.offer,
                      ],
                    ),
                    const Gutter(),
                    Text(
                      'Recommend'.hardCoded,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Gutter(),
                    SizedBox(
                      height: 160.h,
                      child: const RecommendedItemsListView(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
