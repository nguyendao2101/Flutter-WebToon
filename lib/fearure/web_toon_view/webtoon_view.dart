import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/web_toon_view/webtoon_controller.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/themes/theme_controller.dart';

class WebToonView extends StatefulWidget {
  const WebToonView({super.key});

  @override
  State<WebToonView> createState() => _WebToonViewState();
}

class _WebToonViewState extends State<WebToonView> {
  final controller = Get.put(WebToonController());

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
    controller.loadView();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;

    return Scaffold(
      backgroundColor: themeData.value.color.lightBackground,
      body: Center(
          child: Image.asset(
        ImageAssest.web_toon,
        height: 150,
      )),
    );
  }
}
