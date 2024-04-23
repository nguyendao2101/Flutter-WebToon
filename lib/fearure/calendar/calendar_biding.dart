import 'package:get/get.dart';
import 'package:untitled/fearure/calendar/calendar_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalendarController());
  }
}
