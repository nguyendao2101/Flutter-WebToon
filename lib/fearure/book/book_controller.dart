import 'package:get/get.dart';
import 'package:untitled/router/router.dart';

class BookController extends GetxController {
  goToBook() {
    return Get.toNamed(AppRouterName.book);
  }
}
