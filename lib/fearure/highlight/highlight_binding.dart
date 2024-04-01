import 'package:get/get.dart';
import 'package:untitled/fearure/highlight/highlight_controller.dart';

class HighlightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HighlightController());
  }
}
