import 'package:class_a_ec/core/router/app_routes.dart';
import 'package:class_a_ec/features/authentication/presentation/screens/login_screen.dart';
import 'package:class_a_ec/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:class_a_ec/features/home/presentation/screens/home_screen.dart';
import 'package:class_a_ec/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:class_a_ec/features/order/presentation/screens/order_screen.dart';
import 'package:class_a_ec/features/product/data/models/category_model.dart';
import 'package:class_a_ec/features/product/presentation/screens/product_details_screen.dart';
import 'package:class_a_ec/features/product/presentation/screens/product_screen.dart';
import 'package:class_a_ec/features/welcom/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/authentication/presentation/screens/map_view_screen.dart';
import '../../features/cart/screens/cart_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../utils/splash_screen.dart';

part 'go_router_config.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.splashScreen,
    debugLogDiagnostics: true,
    redirect: (BuildContext context, state) {
      // if (ref.read(loginControllerProvider).requestState ==
      //     RequestState.error) {
      //   SecureStorage.deleteAll();
      //   return AppRoutes.loginScreen;
      // }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.welcomeScreen,
        name: AppRoutes.welcomeScreen,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingScreen,
        name: AppRoutes.onboardingScreen,
        builder: (context, state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        name: AppRoutes.signUpScreen,
        builder: (context, state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.orderScreen,
        name: AppRoutes.orderScreen,
        builder: (context, state) {
          return const OrderScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.productsScreen,
        name: AppRoutes.productsScreen,
        builder: (context, state) {
          return ProductScreen(
            categoryModel: state.extra as CategoryModel,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.productDetailsScreen,
        name: AppRoutes.productDetailsScreen,
        builder: (context, state) {
          return const ProductDetailsScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.mapViewScreen,
        name: AppRoutes.mapViewScreen,
        builder: (context, state) {
          return const MapViewScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.cartScreen,
        name: AppRoutes.cartScreen,
        builder: (context, state) {
          return const CartScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.profileScreen,
        name: AppRoutes.profileScreen,
        builder: (context, state) {
          return const ProfileScreen();
        },
      ),
    ],
  );
}
