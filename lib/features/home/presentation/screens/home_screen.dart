import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/header_widget.dart';
import 'package:class_a_ec/features/home/presentation/widgets/best_seller_list_view.dart';
import 'package:class_a_ec/features/home/presentation/widgets/cart_drawer.dart';
import 'package:class_a_ec/features/home/presentation/widgets/categories_list_view.dart';
import 'package:class_a_ec/features/home/presentation/widgets/image_slider.dart';
import 'package:class_a_ec/features/home/presentation/widgets/notification_drawer.dart';
import 'package:class_a_ec/features/home/presentation/widgets/recommended_items_list_view.dart';
import 'package:class_a_ec/features/home/presentation/widgets/search_container.dart';
import 'package:class_a_ec/features/home/presentation/widgets/svg_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/profile_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentDrawerIndex = 0;
  final List<Widget> _drawerWidgets = [
    const ProfileDrawer(),
    const CartDrawer(),
    const NotificationDrawer(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          HeaderWidget(
            topPadding: 5.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SearchContainer(),
                    const GutterLarge(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentDrawerIndex = 1;
                        });
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                      child: const SVGIconContainer(
                        iconPath: SVGIconPaths.cartIcon,
                      ),
                    ),
                    const GutterSmall(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentDrawerIndex = 2;
                        });
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                      child: const SVGIconContainer(
                        iconPath: SVGIconPaths.notificationIcon,
                      ),
                    ),
                    const GutterSmall(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentDrawerIndex = 0;
                        });
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                      child: const SVGIconContainer(
                        iconPath: SVGIconPaths.profileIcon,
                      ),
                    ),
                  ],
                ),
                const Gutter(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsManager.goodMorning,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      Text(
                        StringsManager.riseAndShineItIsOrderTime,
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
                padding: EdgeInsets.symmetric(
                  vertical: 32.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100.h,
                      child: const CategoriesListView(),
                    ),
                    Divider(
                      color: ColorsManager.mainColor.withAlpha(
                        127,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Text(
                            StringsManager.bestSeller,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Text(
                            StringsManager.viewAll,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
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
                    ),
                    const Gutter(),
                    SizedBox(
                      height: 120.h,
                      child: const BestSellerListView(),
                    ),
                    const Gutter(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const ImageSlider(
                        isLocal: true,
                        viewPort: 1,
                        images: [
                          ImagePaths.offer,
                          ImagePaths.offer,
                          ImagePaths.offer,
                          ImagePaths.offer,
                        ],
                      ),
                    ),
                    const Gutter(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        StringsManager.recommended,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
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
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.85,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomLeft: Radius.circular(60),
          ),
        ),
        child: _drawerWidgets[_currentDrawerIndex],
      ),
    );
  }
}
