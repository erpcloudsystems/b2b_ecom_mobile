import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrader/upgrader.dart';
import 'core/global/notifications.dart';
import 'core/global/provider_observer.dart';
import 'core/global/shared_preference_provider.dart';
import 'core/resources/strings_manager.dart';
import 'core/resources/theme_manager.dart';
import 'core/router/go_router_config.dart';
import 'core/utils/eager_initialization.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    log('Handling a background message ${message.messageId}');
  }
  if (message.notification != null) {
    await Notifications.showNotification(
        message.notification?.title, message.notification?.body);
  }
}

void main() async {
  // FlutterError.onError = ErrorHandler.handleFlutterError;
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Notifications.init();
  await SingletonSharedPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      observers: [
        MyObserver(),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, _) {
        return EagerInitialization(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: StringsManager.appName,
            theme: AppTheme.getApplicationLightTheme(),
            routerConfig: ref.read(goRouterProvider),
            builder: (context, child) {
              return UpgradeAlert(
                navigatorKey:
                    ref.read(goRouterProvider).routerDelegate.navigatorKey,
                child: child ?? const Text('child'),
              );
            },
          ),
        );
      },
    );
  }
}
