// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class AppColor {
  final Color primary;
  final Color secondary;
  final Color boldBackground;
  final Color lightBackground;
  AppColor._({
    required this.primary,
    required this.secondary,
    required this.boldBackground,
    required this.lightBackground,
  });

  factory AppColor.blue() => AppColor._(
      primary: const Color(0xff007f73),
      secondary: const Color(0xff4ccd99),
      boldBackground: const Color(0xffffc700),
      lightBackground: const Color(0xff222831));
  factory AppColor.green() => AppColor._(
      primary: const Color(0xffEEEEEE),
      secondary: const Color(0xff67c6e3),
      boldBackground: const Color(0xff000000),
      lightBackground: const Color(0xffEEEEEE));
}
