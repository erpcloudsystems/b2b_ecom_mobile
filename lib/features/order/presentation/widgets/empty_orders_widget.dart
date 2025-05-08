import 'package:class_a_ec/core/resources/colors_managers.dart';
import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_svg/svg.dart';

class EmptyOrdersWidget extends StatelessWidget {
  const EmptyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SVGIconPaths.emptyOrdersIcon,
            colorFilter: ColorFilter.mode(
              ColorsManager.mainColor.withAlpha(80),
              BlendMode.srcIn,
            ),
          ),
          const GutterLarge(),
          Text(
            StringsManager.youDoNotHaveAnyActiveOrdersAtThisTime,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorsManager.mainColor,
                ),
          ),
        ],
      ),
    );
  }
}
