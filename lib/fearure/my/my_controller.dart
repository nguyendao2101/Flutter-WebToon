import 'package:get/get.dart';
import 'package:untitled/home/home_gruments.dart';
import 'package:untitled/router/router.dart';

class MyController extends GetxController {
  goToBook() {
    return Get.toNamed(AppRouterName.calendar);
  }

  goToHightlight() {
    return Get.toNamed(AppRouterName.hightlight);
  }

  goToSetting() {
    return Get.toNamed(AppRouterName.setting);
  }

  goToHome() {
    return Get.toNamed(AppRouterName.home,
        arguments: HomeAgrument(username: '', password: ''));
  }
}
