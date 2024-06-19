import 'package:get/get.dart';
import 'package:untitled/router/router.dart';

class WebToonController extends GetxController {
  void loadView() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(AppRouterName.bottomnav);
  }
}
