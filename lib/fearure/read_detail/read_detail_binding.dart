import 'package:get/get.dart';
import 'package:untitled/fearure/read_detail/read_detail_controller.dart';

class ReadDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReadDetailController());
  }
}
