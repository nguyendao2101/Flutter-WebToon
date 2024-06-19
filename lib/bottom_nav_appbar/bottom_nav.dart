import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/bottom_nav_appbar/bottom_nav_controller.dart';
import 'package:untitled/fearure/calendar/calendar_view.dart';
import 'package:untitled/fearure/sport_light/sport_light_view.dart';
import 'package:untitled/fearure/settings/setting_view.dart';
import 'package:untitled/home/home_view.dart';
import 'package:untitled/themes/theme_controller.dart';

class BottomNavigationApp extends StatelessWidget {
  final BottomNavigationController controller =
      Get.find<BottomNavigationController>();

  BottomNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;

    return Scaffold(
      body: Obx(() => _getBody(controller.selectedIndex.value)),
      bottomNavigationBar: Obx(() => Container(
            decoration: BoxDecoration(
                color: themeData.value.color.lightBackground,
                boxShadow: const [
                  BoxShadow(color: Colors.black, blurRadius: 25)
                ]),
            child: BottomNavigationBar(
              backgroundColor:
                  themeData.value.color.lightBackground, // Thiết lập màu nền
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.black,
              selectedLabelStyle: const TextStyle(color: Colors.green),
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.house,
                    size: 24,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today,
                    size: 24,
                  ),
                  label: 'Calendar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.highlight,
                    size: 24,
                  ),
                  label: 'Sportlight',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 24,
                  ),
                  label: 'More',
                ),
              ],
              currentIndex: controller.selectedIndex.value,
              onTap: (index) {
                controller.changePage(index);
              },
            ),
          )),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const CalendarView();
      case 2:
        return const SportLightView();
      case 3:
        return const SettingView();
      default:
        return Container();
    }
  }
}
