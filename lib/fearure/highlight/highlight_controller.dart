import 'package:get/get.dart';
import 'package:untitled/home/home_gruments.dart';
import 'package:untitled/router/router.dart';

class HighlightController extends GetxController {
  goToBook() {
    return Get.toNamed(AppRouterName.calendar);
  }

  goToMy() {
    return Get.toNamed(AppRouterName.my);
  }

  goToSetting() {
    return Get.toNamed(AppRouterName.setting);
  }

  goToHome() {
    return Get.toNamed(AppRouterName.home,
        arguments: HomeAgrument(username: '', password: ''));
  }
}
