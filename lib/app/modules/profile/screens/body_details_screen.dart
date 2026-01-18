import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repcy/app/resources/colors.dart';
import 'package:repcy/app/routes/app_routes.dart';
import 'package:repcy/app/widgets/custom_button.dart';
import 'package:repcy/app/widgets/custom_textfield.dart';

class BodyDetailsScreen extends StatelessWidget {
  BodyDetailsScreen({super.key});

  final RxBool isExpanded = false.obs;
  final RxString selectedGender = ''.obs;

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
                "Please provide the information below",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Text(
                "Gender",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              Obx(
                () => AnimatedSize(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  child: InkWell(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      isExpanded.value = !isExpanded.value;
                    },
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primaryColor.withValues(alpha: 0.5),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // 🔥 IMPORTANT
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Text(
                                  selectedGender.value.isEmpty
                                      ? "Select your gender"
                                      : selectedGender.value.capitalizeFirst!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                isExpanded.value
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                              ),
                            ],
                          ),

                          if (isExpanded.value) ...[
                            const SizedBox(height: 12),

                            _GenderTile(
                              label: "Male",
                              value: "male",
                              selectedValue: selectedGender.value,
                              onTap: () {
                                selectedGender.value = "male";
                                isExpanded.value = false;
                              },
                            ),

                            _GenderTile(
                              label: "Female",
                              value: "female",
                              selectedValue: selectedGender.value,
                              onTap: () {
                                selectedGender.value = "female";
                                isExpanded.value = false;
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                "Weight",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              CustomTextField(
                hintText: "Enter your weight",
                keyboardType: TextInputType.number,
                bgColor: Colors.white,
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                "Height",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              CustomTextField(
                hintText: "Enter your height",
                keyboardType: TextInputType.number,
                bgColor: Colors.white,
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                "What is your weight goal?",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              CustomTextField(
                hintText: "Enter your weight goal",
                keyboardType: TextInputType.number,
                bgColor: Colors.white,
              ),
              SizedBox(height: Get.height * 0.25),
              CustomButton(
                ontap: () => Get.toNamed(AppRoutes.goalScreen),
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

class _GenderTile extends StatelessWidget {
  final String label;
  final String value;
  final String selectedValue;
  final VoidCallback onTap;

  const _GenderTile({
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == selectedValue;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? AppColors.primaryColor : Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
