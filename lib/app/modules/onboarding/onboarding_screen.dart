import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repcy/app/resources/colors.dart';
import 'package:repcy/app/routes/app_routes.dart';
import 'package:repcy/app/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/young.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.6),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: Get.height * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/repcylogo.png',
                  width: 60,
                  height: 60,
                ),
                SizedBox(width: 10),
                Text(
                  "REPCY",
                  style: GoogleFonts.poppins(
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // SizedBox(height: Get.height * 0.15),
            Center(
              child: Text(
                "Workout and Keepfit",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.2),
            Center(
              child: Text(
                "Welcome to Repcy",
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.2),
            CustomButton(
              ontap: () => Get.toNamed(AppRoutes.bodyDetailsScreen),
              isLoading: false.obs,
              child: Text(
                "Get Started",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomButton(
              ontap: () => Get.toNamed(AppRoutes.loginScreen),
              bgColor: Colors.transparent,
              border: Border.all(width: 1, color: AppColors.primaryColor),
              isLoading: false.obs,
              child: Text(
                "Already have an account?",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
