import 'package:get/get.dart';
import 'package:repcy/app/modules/auth/screens/login_screen.dart';
import 'package:repcy/app/modules/auth/screens/signup_screen.dart';
import 'package:repcy/app/modules/home/screens/calories_screen.dart';
import 'package:repcy/app/modules/home/screens/home_screen.dart';
import 'package:repcy/app/modules/home/screens/rest_timer_screen.dart';
import 'package:repcy/app/modules/notification/screens/notification_request_screen.dart';
import 'package:repcy/app/modules/onboarding/onboarding_screen.dart';
import 'package:repcy/app/modules/profile/screens/body_details_screen.dart';
import 'package:repcy/app/modules/profile/screens/goal_screen.dart';
import 'package:repcy/app/modules/profile/screens/workout_routine_time_screen.dart';
import 'package:repcy/app/modules/splash/splash_screen.dart';
import 'package:repcy/app/modules/subscription/subscription_screen.dart';
import 'package:repcy/app/modules/workout/screens/two_days_workout_screen.dart';
import 'package:repcy/app/modules/workout/screens/workout_day_details_screen.dart';
import 'package:repcy/app/modules/workout/screens/workout_player_screen.dart';
import 'package:repcy/app/modules/workout/screens/workout_program_screen.dart';
import 'package:repcy/app/modules/workout/screens/workout_split_screen.dart';
import 'package:repcy/app/routes/app_routes.dart';
import 'package:repcy/app/widgets/bottom_navigation_widget.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.bodyDetailsScreen, page: () => BodyDetailsScreen()),
    GetPage(name: AppRoutes.goalScreen, page: () => GoalScreen()),
    GetPage(
      name: AppRoutes.workoutRoutineTimeScreen,
      page: () => WorkoutRoutineTimeScreen(),
    ),
    GetPage(
      name: AppRoutes.notificationRequestScreen,
      page: () => NotificationRequestScreen(),
    ),
    GetPage(
      name: AppRoutes.subscriptionScreen,
      page: () => SubscriptionScreen(),
    ),
    GetPage(name: AppRoutes.signupScreen, page: () => SignupScreen()),
    GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen()),
    GetPage(name: AppRoutes.homeScreen, page: () => HomeScreen()),
    GetPage(
      name: AppRoutes.bottomNavigation,
      page: () => BottomNavigationWidget(),
    ),
    GetPage(name: AppRoutes.caloriesScreen, page: () => CaloriesScreen()),
    GetPage(name: AppRoutes.restTimerScreen, page: () => RestTimerScreen()),
    GetPage(name: AppRoutes.workoutSplit, page: () => WorkoutSplitScreen()),
    GetPage(name: AppRoutes.twoDaysWorkoutScreen, page: () => TwoDaysWorkoutScreen()),
    GetPage(name: AppRoutes.workoutProgramScreen, page: () => WorkoutProgramScreen()),
    GetPage(name: AppRoutes.workoutDayDetailsScreen, page: () => WorkoutDayDetailScreen()),
    GetPage(name: AppRoutes.workoutPlayerScreen, page: () => WorkoutPlayerScreen()),
  ];
}
