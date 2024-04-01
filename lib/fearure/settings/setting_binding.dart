import 'package:get/get.dart';
import 'package:untitled/fearure/settings/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
