import 'package:get/get.dart';
import 'package:untitled/bottom_nav_appbar/bottom_binding.dart';
import 'package:untitled/bottom_nav_appbar/bottom_nav.dart';
import 'package:untitled/fearure/calendar/calendar_biding.dart';
import 'package:untitled/fearure/calendar/calendar_view.dart';
import 'package:untitled/fearure/search/search_binding.dart';
import 'package:untitled/fearure/search/search_view.dart';
import 'package:untitled/fearure/sport_light/sport_light_view.dart';
import 'package:untitled/fearure/manga_detail/manga_detail_binding.dart';
import 'package:untitled/fearure/manga_detail/manga_detail_view.dart';
import 'package:untitled/fearure/read_detail/read_detail_binding.dart';
import 'package:untitled/fearure/read_detail/read_detail_view.dart';
import 'package:untitled/fearure/settings/setting_binding.dart';
import 'package:untitled/fearure/settings/setting_view.dart';
import 'package:untitled/fearure/web_toon_view/webtoon_binding.dart';
import 'package:untitled/fearure/web_toon_view/webtoon_view.dart';
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
      page: () => MyHomePage(
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
      name: AppRouterName.sport_light,
      page: () => const SportLightView(),
      binding: SettingBinding(),
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
    GetPage(
      name: AppRouterName.mangaDetail,
      page: () => const MangaDetailPage(),
      binding: MangaDetailBinding(),
    ),
    GetPage(
      name: AppRouterName.readDetail,
      page: () => const ReadDetailView(),
      binding: ReadDetailBinding(),
    ),
    GetPage(
      name: AppRouterName.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRouterName.webtoon,
      page: () => const WebToonView(),
      binding: WebToonBinding(),
    ),
  ];
}

class AppRouterName {
  static const login = '/';
  static const register = '/register';
  static const home = '/home';
  static const calendar = '/calendar';
  // ignore: constant_identifier_names
  static const sport_light = '/sport_light';
  static const setting = '/setting';
  static const bottomnav = '/bottom_nav';
  static const mangaDetail = '/manga_Detail';
  static const readDetail = '/read_Detail';
  static const search = '/search';
  static const webtoon = '/webtoon';
}
