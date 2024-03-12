import 'package:get/get.dart';
import 'package:untitled/themes/app_theme.dart';

class ThemeController extends GetxController {
  final themeData = AppTheme.green().obs;

  void changeTheme() {
    print(themeData.value.themeName);
    if (themeData.value.themeName == AppThemes.blue) {
      themeData.value = AppTheme.green();
    } else {
      themeData.value = AppTheme.blue();
    }
  }
}
