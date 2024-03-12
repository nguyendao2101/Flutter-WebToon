import 'package:untitled/themes/app_color.dart';
import 'package:untitled/themes/app_text.dart';

enum AppThemes {
  blue,
  green,
}

class AppTheme {
  final AppColor color;
  final AppThemes themeName;
  final AppText text;

  AppTheme._({
    required this.color,
    required this.themeName,
    required this.text,
  });

  factory AppTheme.blue() => AppTheme._(
      color: AppColor.blue(), themeName: AppThemes.blue, text: AppText.blue());

  factory AppTheme.green() => AppTheme._(
      color: AppColor.green(),
      themeName: AppThemes.green,
      text: AppText.green());
}
