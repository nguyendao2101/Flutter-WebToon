import 'package:get/get.dart';
import 'package:untitled/themes/app_theme.dart';

class ThemeController extends GetxController {
  final themeData = AppTheme.green().obs;
  RxBool _isDarkMode =
      false.obs; // Sử dụng GetX để quản lý trạng thái có thể quan sát

  // Getter để xác định chế độ chủ đề hiện tại có phải là chế độ tối không
  bool get isDarkMode => _isDarkMode.value;

  // Phương thức để chuyển đổi chủ đề
  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    // Thêm logic để áp dụng chủ đề mới (không hiển thị ở đây)
  }

  void changeTheme() {
    // print(themeData.value.themeName);
    if (themeData.value.themeName == AppThemes.blue) {
      themeData.value = AppTheme.green();
    } else {
      themeData.value = AppTheme.blue();
    }
  }
}
