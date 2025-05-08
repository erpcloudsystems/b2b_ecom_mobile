import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:class_a_ec/features/order/presentation/widgets/order_status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class OrdersFilterWidget extends StatefulWidget {
  const OrdersFilterWidget({super.key});

  @override
  OrdersFilterWidgetState createState() => OrdersFilterWidgetState();
}

class OrdersFilterWidgetState extends State<OrdersFilterWidget> {
  String selectedStatus = StringsManager.pending;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedStatus = StringsManager.pending;
              });
            },
            child: OrderStatusCard(
              status: StringsManager.pending,
              isSelected: selectedStatus == StringsManager.pending,
            ),
          ),
        ),
        const Gutter(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedStatus = StringsManager.completed;
              });
            },
            child: OrderStatusCard(
              status: StringsManager.completed,
              isSelected: selectedStatus == StringsManager.completed,
            ),
          ),
        ),
        const Gutter(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedStatus = StringsManager.canceled;
              });
            },
            child: OrderStatusCard(
              status: StringsManager.canceled,
              isSelected: selectedStatus == StringsManager.canceled,
            ),
          ),
        ),
        const Gutter(),
      ],
    );
  }
}
