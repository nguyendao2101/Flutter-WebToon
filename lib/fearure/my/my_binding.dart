import 'package:get/get.dart';
import 'package:untitled/fearure/my/my_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyController());
  }
}
