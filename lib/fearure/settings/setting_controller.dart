import 'package:get/get.dart';
import 'package:untitled/home/home_gruments.dart';
import 'package:untitled/router/router.dart';

class SettingController extends GetxController {
  goToBook() {
    return Get.toNamed(AppRouterName.book);
  }

  goToHightlight() {
    return Get.toNamed(AppRouterName.hightlight);
  }

  goToMy() {
    return Get.toNamed(AppRouterName.my);
  }

  goToHome() {
    return Get.toNamed(AppRouterName.home,
        arguments: HomeAgrument(username: '', password: ''));
  }
}
