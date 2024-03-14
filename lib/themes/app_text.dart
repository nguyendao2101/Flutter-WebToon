// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppText {
  final TextStyle h12;
  final TextStyle h14;
  final TextStyle h16;
  final TextStyle h18;
  AppText._({
    required this.h12,
    required this.h14,
    required this.h16,
    required this.h18,
  });

  factory AppText.blue() => AppText._(
      h12: const TextStyle(fontSize: 12, color: Colors.yellow),
      h14: const TextStyle(fontSize: 14, color: Colors.yellow),
      h16: const TextStyle(fontSize: 16, color: Colors.yellow),
      h18: const TextStyle(fontSize: 13, color: Colors.yellow));
  factory AppText.green() => AppText._(
      h12: const TextStyle(fontSize: 12, color: Color(0xFF757575)),
      h14: const TextStyle(fontSize: 14, color: Color(0xff5356ff)),
      h16: const TextStyle(fontSize: 16, color: Color(0xFF616161)),
      h18: const TextStyle(fontSize: 13, color: Color(0xFF616161)));
}
