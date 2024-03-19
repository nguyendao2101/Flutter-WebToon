import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/book/book_controller.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.green,
        ),
      ),
    );
  }
}
