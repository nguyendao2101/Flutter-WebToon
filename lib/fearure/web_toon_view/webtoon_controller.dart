import 'package:get/get.dart';
import 'package:untitled/fearure/login/login_view.dart';

class WebToonController extends GetxController {
  void loadView() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.to(() => MyHomePage(title: ''));
    // Get.toNamed(AppRouterName.login);
  }
}
