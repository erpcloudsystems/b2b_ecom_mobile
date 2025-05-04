import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:class_a_ec/core/global/shared_preference_provider.dart';
import 'package:class_a_ec/core/resources/constance.dart';
import 'package:class_a_ec/core/resources/image_paths.dart';
import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  String routePath = AppRoutes.welcomeScreen;
  Future<void> autoLogin() async {
    // final bool isLoggedIn =
    //     await ref.read(loginControllerProvider.notifier).isCached();
    // if (isLoggedIn) {
    //   routePath = AppRoutes.layoutScreen;
    //   await ref.read(noteControllerProvider.notifier).getNotes();
    // } else {
    //   routePath = AppRoutes.loginScreen;
    // }
    final sharedPref = SingletonSharedPreferences.instance;
    if (sharedPref.getBool(isFirstTimeUserKey) == null) {
      await sharedPref.setBool(isFirstTimeUserKey, true);
    } else {
      await sharedPref.setBool(isFirstTimeUserKey, false);
    }
    await Future.delayed(const Duration(seconds: 3), () {});
    if (mounted) {
      context.go(routePath);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.scale(
        useImmersiveMode: false,
        asyncNavigationCallback: () async {
          await autoLogin();
        },
        backgroundColor: Colors.white,
        childWidget: const Center(
          child: Image(
            image: AssetImage(ImagePaths.logo),
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
