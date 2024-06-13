// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppColor {
  final Color primary;
  final Color secondary;
  final Color boldBackground;
  final Color lightBackground;
  final Color iconBlack;

  AppColor._({
    required this.primary,
    required this.secondary,
    required this.boldBackground,
    required this.lightBackground,
    required this.iconBlack,
  });

  factory AppColor.blue() => AppColor._(
      primary: const Color(0xff007f73),
      secondary: Colors.green,
      boldBackground: const Color(0xffffc700),
      lightBackground: const Color(0xff222831),
      iconBlack: const Color(0xFF030405));
  factory AppColor.green() => AppColor._(
        primary: const Color(0xffEEEEEE),
        secondary: const Color.fromARGB(255, 107, 121, 115),
        boldBackground: const Color(0xff000000),
        lightBackground: const Color(0xffEEEEEE),
        iconBlack: const Color(0xffffc700),
      );
}
