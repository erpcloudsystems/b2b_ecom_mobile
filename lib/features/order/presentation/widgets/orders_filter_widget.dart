import 'package:class_a_ec/core/extensions/string_extension.dart';
import 'package:class_a_ec/features/order/presentation/widgets/order_status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class OrdersFilterWidget extends StatefulWidget {
  const OrdersFilterWidget({super.key});

  @override
  OrdersFilterWidgetState createState() => OrdersFilterWidgetState();
}

class OrdersFilterWidgetState extends State<OrdersFilterWidget> {
  String selectedStatus = 'Pending';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedStatus = 'Pending';
              });
            },
            child: OrderStatusCard(
              status: 'Pending'.hardCoded,
              isSelected: selectedStatus == 'Pending',
            ),
          ),
        ),
        const Gutter(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedStatus = 'Completed';
              });
            },
            child: OrderStatusCard(
              status: 'Completed'.hardCoded,
              isSelected: selectedStatus == 'Completed',
            ),
          ),
        ),
        const Gutter(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedStatus = 'Canceled';
              });
            },
            child: OrderStatusCard(
              status: 'Canceled'.hardCoded,
              isSelected: selectedStatus == 'Canceled',
            ),
          ),
        ),
        const Gutter(),
      ],
    );
  }
}
