import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/login/login_binding.dart';
import 'package:untitled/fearure/login/login_view.dart';
import 'package:untitled/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: LoginBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(),
          textTheme: const TextTheme(
              labelLarge: TextStyle(
            color: Colors.black,
          ))),
      getPages: AppRouter.router,
      home: const MyHomePage(title: 'ĐĂNG NHẬP '),
    );
  }
}
