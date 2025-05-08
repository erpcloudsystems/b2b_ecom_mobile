import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLocal {
  static String path = 'assets/local';

  static const List<Locale> supportLocals = [
    Locale('en'),
    Locale('ar'),
  ];

  static bool isEnglish = false;

  ///switch locals
  static Future<void> toggleBetweenLocales(BuildContext context) async {
    if (isEnglish) {
      // await context.setLocale(AppLocal.enLocal);
      await context.setLocale(supportLocals[0]);
      await WidgetsBinding.instance.performReassemble();
    } else {
      await context.setLocale(supportLocals[1]);
      await WidgetsBinding.instance.performReassemble();
    }
  }

  ///reset device local
  static Locale? fallbackLocal(
    Locale? currentLocal,
    Iterable<Locale> supportLocal,
  ) {
    if (currentLocal != null) {
      for (final Locale locale in supportLocal) {
        if (locale.languageCode == currentLocal.languageCode) {
          return currentLocal;
        }
      }
    }
    return null;
  }
}
