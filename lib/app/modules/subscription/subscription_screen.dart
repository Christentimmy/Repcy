import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repcy/app/resources/colors.dart';
import 'package:repcy/app/routes/app_routes.dart';
import 'package:repcy/app/widgets/custom_button.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({super.key});

  final RxBool isExpanded = false.obs;
  final RxString selectedGender = ''.obs;

  final subscriptions = [
    {
      "title": "12 months",
      "value": "USD 239.88/year",
      "subtitle": "USD 19.99/month",
    },
    {"title": "1 month", "value": "USD 29.99/year", "subtitle": ""},
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
              SizedBox(height: Get.height * 0.008),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.cancel, color: Colors.grey, size: 25),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Improve your workout,\nmaximize your results!",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: Get.height * 0.05),
              Center(
                child: Text(
                  "Join Repcy today and transform your body.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.1),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: subscriptions.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      selectedIndex.value = index;
                    },
                    child: Obx(
                      () => Container(
                        width: Get.width,
                        height: 80,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(15),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  subscriptions[index]['title']!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subscriptions[index]['subtitle'] != ''
                                    ? Text(
                                        subscriptions[index]['subtitle']!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              subscriptions[index]['value']!,
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
              SizedBox(height: Get.height * 0.1),
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
              SizedBox(height: Get.height * 0.01),
              Center(
                child: Text(
                  "You will be charged USD 239.88 every 12 months until cancellation.No commitment, cancel anytime.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
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
