import 'package:untitled/themes/app_color.dart';

enum AppThemes {
  blue,
  green,
}

class AppTheme {
  final AppColor color;
  final AppThemes themeName;

  AppTheme._({
    required this.color,
    required this.themeName,
  });

  factory AppTheme.blue() =>
      AppTheme._(color: AppColor.blue(), themeName: AppThemes.blue);

  factory AppTheme.green() =>
      AppTheme._(color: AppColor.green(), themeName: AppThemes.green);
}
