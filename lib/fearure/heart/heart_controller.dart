import 'package:get/get.dart';
import 'package:untitled/router/router.dart';

class HeartController extends GetxController {
  gotoHome() {
    return Get.toNamed(AppRouterName.home);
  }
}
