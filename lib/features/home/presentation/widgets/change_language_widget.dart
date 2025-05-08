import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/colors_managers.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                'English',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
              onTap: () {
                context.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'عربي',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
              onTap: () {
                context.setLocale(const Locale('ar'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
