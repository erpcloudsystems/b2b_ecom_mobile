import 'package:class_a_ec/features/order/data/models/order_model.dart';
import 'package:class_a_ec/features/order/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrdersListWidget extends StatelessWidget {
  const OrdersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (context, index) {
          return OrderCard(orderModel: orderList[0]);
        },
      ),
    );
  }
}
