import 'package:get/get.dart';
import 'package:untitled/home/home_gruments.dart';
import 'package:untitled/router/router.dart';

class BookController extends GetxController {
  goToHightlight() {
    return Get.toNamed(AppRouterName.hightlight);
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
