import 'package:get/get.dart';
import 'package:untitled/bottom_nav_appbar/bottom_nav_controller.dart';
import 'package:untitled/fearure/calendar/calendar_controller.dart';
import 'package:untitled/fearure/sport_light/sport_light_controller.dart';
import 'package:untitled/fearure/settings/setting_controller.dart';
import 'package:untitled/home/home_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CalendarController());
    Get.lazyPut(() => SportLightController());
    Get.lazyPut(() => SettingController());
  }
}
