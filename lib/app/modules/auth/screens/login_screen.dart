import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repcy/app/resources/colors.dart';
import 'package:repcy/app/routes/app_routes.dart';
import 'package:repcy/app/widgets/custom_button.dart';
import 'package:repcy/app/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          children: [
            SizedBox(height: Get.height * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/repcylogo.png',
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10),
                Text(
                  "REPCY",
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                "Welcome back!!",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.1),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hintText: "Email",
                    textStyle: GoogleFonts.poppins(color: Colors.white),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  CustomTextField(
                    hintText: "Password",
                    textStyle: GoogleFonts.poppins(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.1),
                ],
              ),
            ),
            CustomButton(
              ontap: () => Get.toNamed(AppRoutes.bottomNavigation),
              isLoading: false.obs,
              child: Text(
                "login",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.005),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(AppRoutes.signupScreen),
                  child: Text(
                    "SignUp",
                    style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
