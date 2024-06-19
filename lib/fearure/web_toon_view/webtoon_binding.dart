import 'package:get/get.dart';
import 'package:untitled/fearure/web_toon_view/webtoon_controller.dart';

class WebToonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebToonController());
  }
}
