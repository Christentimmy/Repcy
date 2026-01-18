import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repcy/app/resources/colors.dart';
import 'package:repcy/app/routes/app_routes.dart';
import 'package:repcy/app/widgets/custom_button.dart';

class NotificationRequestScreen extends StatelessWidget {
  NotificationRequestScreen({super.key});

  final RxBool isActive = false.obs;
  final RxString selectedNotificationStyle = ''.obs;

  final goals = [
    {
      "title": "Light",
      "value": "Notifications only to remind you of the workout time.",
    },
    {
      "title": "Moderate",
      "value":
          "Notifications during workout days with tips or motivational quotes.",
    },
    {
      "title": "Intense",
      "value": "Notifications everyday with tips and motivational quotes.",
    },
  ];

  final selectedIndex = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Getting started with Repcy",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: 0.2,
                backgroundColor: Colors.grey,
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              SizedBox(height: 10),
              Text(
                "Repcy helps you not to miss any workout and keep you motivated",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Enable notifications",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.7,
                    child: Obx(
                      () => Switch(
                        value: isActive.value,
                        onChanged: (value) => isActive.toggle(),
                        activeColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectedIndex.value = index;
                    },
                    child: Obx(
                      () => Container(
                        width: Get.width,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: selectedIndex.value == index
                              ? const Color.fromARGB(255, 255, 248, 214)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: selectedIndex.value == index
                              ? Border.all(
                                  color: AppColors.primaryColor,
                                  width: 2,
                                )
                              : null,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              goals[index]['title']!,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              goals[index]['value']!,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: Get.height * 0.25),
              CustomButton(
                ontap: () {
                  Get.toNamed(AppRoutes.workoutRoutineTimeScreen);
                },
                isLoading: false.obs,
                child: Text(
                  "Continue",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
