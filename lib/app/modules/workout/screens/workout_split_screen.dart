import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repcy/app/resources/colors.dart';
import 'package:repcy/app/routes/app_routes.dart';
import 'package:repcy/app/widgets/custom_button.dart';

class WorkoutSplitScreen extends StatelessWidget {
  const WorkoutSplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Workout Split",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          children: [
            SizedBox(height: Get.height * 0.03),
            CustomButton(
              ontap: () {
                Get.toNamed(AppRoutes.twoDaysWorkoutScreen);
              },
              bgColor: Color(0xFFFFBFF7),
              isLoading: false.obs,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "2 to 3 days workout",
                    style: GoogleFonts.bubblegumSans(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            CustomButton(
              ontap: () {},
              bgColor: Color(0xFFFFBFF7),
              isLoading: false.obs,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "4 days workout",
                    style: GoogleFonts.bubblegumSans(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            CustomButton(
              ontap: () {},
              bgColor: Color(0xFFFFBFF7),
              isLoading: false.obs,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "5 days workout",
                    style: GoogleFonts.bubblegumSans(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            CustomButton(
              ontap: () {},
              bgColor: Color(0xFFFFBFF7),
              isLoading: false.obs,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Push/Pull/Legs",
                    style: GoogleFonts.bubblegumSans(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.1),
            CustomButton(
              ontap: () => Get.toNamed(AppRoutes.twoDaysWorkoutScreen),
              isLoading: false.obs,
              child: Text(
                "Create Workout Split",
                style: GoogleFonts.bubblegumSans(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
