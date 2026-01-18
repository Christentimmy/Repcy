import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:repcy/app/modules/home/screens/calories_screen.dart';
import 'package:repcy/app/modules/home/screens/home_screen.dart';
import 'package:repcy/app/resources/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({super.key});

  final RxInt currentIndex = 0.obs;
  final pages = [HomeScreen(), CaloriesScreen(), Container(), Container()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Color(0xFFDADADA),
          selectedItemColor: AppColors.primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidHouse, size: 21),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.fire, size: 21),
              label: "Calories",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidClock, size: 21),
              label: "Rest",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidUser, size: 21),
              label: "Profile",
            ),
          ],
          currentIndex: currentIndex.value,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            currentIndex.value = index;
          },
        ),
      ),
    );
  }
}
