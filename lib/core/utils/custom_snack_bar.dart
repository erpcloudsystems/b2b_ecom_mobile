import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    {required BuildContext context, required String message}) {
  FocusScope.of(context).unfocus();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorsManager.mainColor,
      content: Text(
        message,
      ),
    ),
  );
}
