import 'package:get/get.dart';
import 'package:repcy/app/modules/notification/screens/notification_request_screen.dart';
import 'package:repcy/app/modules/onboarding/onboarding_screen.dart';
import 'package:repcy/app/modules/profile/screens/body_details_screen.dart';
import 'package:repcy/app/modules/profile/screens/goal_screen.dart';
import 'package:repcy/app/modules/profile/screens/workout_routine_time_screen.dart';
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
    GetPage(
      name: AppRoutes.bodyDetailsScreen,
      page: () =>  BodyDetailsScreen(),
    ),
    GetPage(
      name: AppRoutes.goalScreen,
      page: () =>  GoalScreen(),
    ),
    GetPage(
      name: AppRoutes.workoutRoutineTimeScreen,
      page: () =>  WorkoutRoutineTimeScreen(),
    ),
    GetPage(
      name: AppRoutes.notificationRequestScreen,
      page: () =>  NotificationRequestScreen(),
    ),
    
   ];
}