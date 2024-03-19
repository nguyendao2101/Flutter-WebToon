// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppText {
  final TextStyle h12;
  final TextStyle h14;
  final TextStyle h16;
  final TextStyle h13;
  final TextStyle h20;
  final TextStyle h18;
  final TextStyle h25;
  final TextStyle h35;

  AppText._({
    required this.h12,
    required this.h14,
    required this.h16,
    required this.h13,
    required this.h20,
    required this.h18,
    required this.h25,
    required this.h35,
  });

  factory AppText.blue() => AppText._(
        h12: const TextStyle(fontSize: 12, color: Colors.yellow),
        h14: const TextStyle(fontSize: 14, color: Colors.yellow),
        h16: const TextStyle(
            fontSize: 16, color: Colors.yellow, fontWeight: FontWeight.bold),
        h13: const TextStyle(
            fontSize: 13, color: Colors.yellow, fontWeight: FontWeight.bold),
        h18: const TextStyle(
            fontSize: 18, color: Colors.yellow, fontWeight: FontWeight.bold),
        h20: const TextStyle(
            fontSize: 20, color: Colors.yellow, fontWeight: FontWeight.bold),
        h25: const TextStyle(
            fontSize: 25, color: Colors.yellow, fontWeight: FontWeight.bold),
        h35: const TextStyle(
            fontSize: 35, color: Colors.yellow, fontWeight: FontWeight.bold),
      );
  factory AppText.green() => AppText._(
        h12: const TextStyle(fontSize: 12, color: Color(0xFF757575)),
        h14: const TextStyle(fontSize: 14, color: Color(0xff5356ff)),
        h16: const TextStyle(fontSize: 16, color: Color(0xFF616161)),
        h13: const TextStyle(fontSize: 13, color: Color(0xFF616161)),
        h18: const TextStyle(
            fontSize: 18,
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold),
        h20: const TextStyle(
            fontSize: 20,
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold),
        h25: const TextStyle(
            fontSize: 25,
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold),
        h35: const TextStyle(
            fontSize: 35,
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold),
      );
}
