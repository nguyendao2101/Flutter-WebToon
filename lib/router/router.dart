import 'package:get/get.dart';
import 'package:untitled/bottom_nav_appbar/bottom_binding.dart';
import 'package:untitled/bottom_nav_appbar/bottom_nav.dart';
import 'package:untitled/fearure/calendar/calendar_biding.dart';
import 'package:untitled/fearure/calendar/calendar_view.dart';
import 'package:untitled/fearure/highlight/highlight_binding.dart';
import 'package:untitled/fearure/highlight/highlight_view.dart';
import 'package:untitled/fearure/my/my_binding.dart';
import 'package:untitled/fearure/my/my_view.dart';
import 'package:untitled/fearure/settings/setting_binding.dart';
import 'package:untitled/fearure/settings/setting_view.dart';
import 'package:untitled/home/home.biding.dart';

import '../fearure/login/login_binding.dart';
import '../fearure/login/login_view.dart';
import '../fearure/register/register_binding.dart';
import '../fearure/register/register_view.dart';
import '../home/home_view.dart';

class AppRouter {
  static final router = [
    GetPage(
      name: AppRouterName.login,
      page: () => const MyHomePage(
        title: '',
      ),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRouterName.register,
      page: () => const Register(
        title: '',
      ),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRouterName.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRouterName.calendar,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: AppRouterName.hightlight,
      page: () => const HighlightView(),
      binding: HighlightBinding(),
    ),
    GetPage(
      name: AppRouterName.my,
      page: () => const MyView(),
      binding: MyBinding(),
    ),
    GetPage(
      name: AppRouterName.setting,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRouterName.bottomnav,
      page: () => BottomNavigationApp(),
      binding: BottomNavBinding(),
    ),
  ];
}

class AppRouterName {
  static const login = '/';
  static const register = '/register';
  static const home = '/home';
  static const calendar = '/calendar';
  static const hightlight = '/hightlight';
  static const my = '/my';
  static const setting = '/setting';
  static const bottomnav = '/bottom_nav';
}
