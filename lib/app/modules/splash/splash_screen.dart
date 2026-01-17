import 'package:repcy/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repcy/app/resources/colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.bgColor,
        child: Center(
          child: FadeTransition(
            opacity: splashController.fadeAnimation,
            child: ScaleTransition(
              scale: splashController.scaleAnimation,
              child: Image.asset(
                'assets/images/repcylogo.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
