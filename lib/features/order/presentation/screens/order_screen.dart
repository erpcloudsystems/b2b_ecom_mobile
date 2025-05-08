import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/body_container.dart';
import 'package:class_a_ec/features/authentication/presentation/widgets/header_widget.dart';
import 'package:class_a_ec/features/order/data/models/order_model.dart';
import 'package:class_a_ec/features/order/presentation/widgets/empty_orders_widget.dart';
import 'package:class_a_ec/features/order/presentation/widgets/orders_filter_widget.dart';
import 'package:class_a_ec/features/order/presentation/widgets/orders_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        HeaderWidget(
          title: StringsManager.myOrders,
          isBackButtonVisible: true,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BodyContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 32.h,
                horizontal: 24.w,
              ),
              child: Column(
                children: [
                  const OrdersFilterWidget(),
                  const Gutter(),
                  if (orderList.isNotEmpty) const OrdersListWidget(),
                  if (orderList.isEmpty) const EmptyOrdersWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
