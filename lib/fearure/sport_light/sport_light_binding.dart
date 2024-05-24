import 'package:get/get.dart';
import 'package:untitled/fearure/sport_light/sport_light_controller.dart';

class HighlightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SportLightController());
  }
}
