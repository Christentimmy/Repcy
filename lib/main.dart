import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:repcy/app/bindings/app_bindings.dart';
import 'package:repcy/app/resources/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repcy/app/routes/app_pages.dart';
import 'package:repcy/app/routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Repcy',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.bgColor,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primaryColor,
          selectionHandleColor: AppColors.primaryColor,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      initialBinding: AppBindings(),
      defaultTransition: Transition.fadeIn,
    );
  }
}
