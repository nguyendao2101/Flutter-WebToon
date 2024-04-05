import 'package:get/get.dart';
import 'package:untitled/bottom_nav_appbar/bottom_nav_controller.dart';
import 'package:untitled/fearure/calendar/calendar_controller.dart';
import 'package:untitled/fearure/highlight/highlight_controller.dart';
import 'package:untitled/fearure/my/my_controller.dart';
import 'package:untitled/fearure/settings/setting_controller.dart';
import 'package:untitled/home/home_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BookController());
    Get.lazyPut(() => HighlightController());
    Get.lazyPut(() => MyController());
    Get.lazyPut(() => SettingController());
  }
}
