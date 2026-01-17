

import 'package:get/get.dart';
import 'package:repcy/app/modules/onboarding/onboarding_screen.dart';
import 'package:repcy/app/modules/splash/splash_screen.dart';
import 'package:repcy/app/routes/app_routes.dart';

class AppPages {
   static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () =>  SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.onboardingScreen,
      page: () =>  OnboardingScreen(),
    ),
   ];
}