import 'package:get/get.dart';
import 'package:untitled/fearure/book/book_biding.dart';
import 'package:untitled/fearure/book/book_view.dart';
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
      name: AppRouterName.book,
      page: () => const BookView(),
      binding: BookBinding(),
    ),
  ];
}

class AppRouterName {
  static const login = '/';
  static const register = '/register';
  static const home = '/home';
  static const book = '/book';
}
