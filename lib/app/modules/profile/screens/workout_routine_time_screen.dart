import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repcy/app/resources/colors.dart';
import 'package:repcy/app/widgets/custom_button.dart';

class WorkoutRoutineTimeScreen extends StatelessWidget {
  WorkoutRoutineTimeScreen({super.key});

  final workoutRoutineTime = [
    "1 time",
    "2 times",
    "3 times",
    "4 times",
    "5 times",
    "6 times",
    "7 times",
  ];

  final selectedRoutine = [].obs;

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
                "How many times do you workout per week?",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "Select between 2 and 6 times per week",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: workoutRoutineTime.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (selectedRoutine.contains(index)) {
                        selectedRoutine.remove(index);
                      } else if (selectedRoutine.length <= 5) {
                        selectedRoutine.add(index);
                      }
                    },
                    child: Obx(
                      () => Container(
                        width: Get.width,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: selectedRoutine.contains(index)
                              ? const Color.fromARGB(255, 255, 248, 214)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: selectedRoutine.contains(index)
                              ? Border.all(
                                  color: AppColors.primaryColor,
                                  width: 2,
                                )
                              : null,
                        ),
                        child: Row(
                          children: [
                            Text(
                              workoutRoutineTime[index],
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            selectedRoutine.contains(index)
                                ? CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: Get.height * 0.06),
              CustomButton(
                ontap: () {
                  // Get.toNamed(AppRoutes.workoutRoutineTime);
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
