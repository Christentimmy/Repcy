import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repcy/app/resources/colors.dart';
import 'package:repcy/app/widgets/custom_button.dart';

class RestTimerScreen extends StatelessWidget {
  RestTimerScreen({super.key});

  final times = ["off", "5s", "10s", "20s", "30s", "1min", "2min", "5min"];

  final isCustom = false.obs;
  final RxInt _selectedTime = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Rest Timer',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            // crossAxisAlignment: CrossAxi/sAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.05),
              Divider(),
              SizedBox(
                height: Get.height * 0.6,
                child: ListView.builder(
                  itemCount: times.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _selectedTime.value = index;
                      },
                      child: Column(
                        children: [
                          // Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Center(
                              child: Obx(
                                () => Text(
                                  times[index],
                                  style: GoogleFonts.bubblegumSans(
                                    fontSize: 14,
                                    color: _selectedTime.value != index
                                        ? Colors.white
                                        : AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // SizedBox(height: Get.height * 0.01),
              CustomButton(
                ontap: () {},
                isLoading: false.obs,
                child: Text(
                  "Done",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.008),
              Row(
                children: [
                  Text(
                    "Custom setup your rest time?",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.7,
                    child: Obx(
                      () => Switch(
                        value: isCustom.value,
                        activeColor: AppColors.primaryColor,
                        onChanged: (value) => isCustom.value = value,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
