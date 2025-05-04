import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class NoMoreDataWidget extends StatelessWidget {
  const NoMoreDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        StringsManager.noMoreData,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
