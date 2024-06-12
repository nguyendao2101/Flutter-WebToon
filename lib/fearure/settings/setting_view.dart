import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/settings/setting_controller.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/themes/app_theme.dart';
import 'package:untitled/themes/theme_controller.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final _scrollController = ScrollController();
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;

    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: themeData.value.color.lightBackground,
              toolbarHeight: 60,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: Container(
                  color: const Color(0xFFB9B6B6),
                  height: 0.8,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'More',
                    style: themeData.value.text.h25,
                  ),
                ],
              ),
            ),
            backgroundColor: themeData.value.color.lightBackground,
            body: SafeArea(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              themeController.changeTheme();
                            },
                            child: Text(
                              "Change Theme",
                              style: themeData.value.text.h14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, bottom: 15, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [_coint(), _textCoint()],
                          ),
                          _buyCoint(),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.8,
                      color: Colors.grey[400],
                    ),
                    _getTakeFreeCoint(),
                    Divider(
                      thickness: 0.8,
                      color: Colors.grey[400],
                    ),
                    _webtoonShop(),
                    Divider(
                      thickness: 0.8,
                      color: Colors.grey[400],
                    ),
                    _logoFunction(),
                    Divider(
                      thickness: 0.8,
                      color: Colors.grey[400],
                    ),
                    _textNotice(),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
          _feedBackToAuthor(),
          // Icon buton
          _iconSetting(themeData),
        ],
      ),
    );
  }

  Positioned _iconSetting(Rx<AppTheme> themeData) {
    return Positioned(
      top: 36,
      right: 20,
      child: GestureDetector(
        onTap: () {
          // Xử lý khi người dùng nhấn vào biểu tượng
        },
        child: Icon(
          Icons.settings,
          color: themeData.value.color.boldBackground,
          size: 30,
        ),
      ),
    );
  }

  Positioned _feedBackToAuthor() {
    return const Positioned(
      bottom: 100,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Icon(
            Icons.email,
            size: 50,
            color: Colors.grey,
          ),
          Text('Feed back',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }

  Padding _textNotice() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const Text(
            ' Notice',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Image.asset(
            ImageAssest.sangNgang,
            height: 25,
          ),
          const Text(
            'Comment Section Upgrade',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Padding _logoFunction() {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              Icon(
                Icons.search,
                size: 50,
              ),
              Text('Search')
            ],
          ),
          Column(
            children: [
              Image.asset(
                ImageAssest.auto_darklight,
                height: 40,
              ),
              const SizedBox(height: 10),
              const Text('Set Theme')
            ],
          ),
          Column(
            children: [
              Image.asset(ImageAssest.dich, height: 45),
              const SizedBox(height: 5),
              const Text('Fan Translation'),
            ],
          )
        ],
      ),
    );
  }

  Padding _webtoonShop() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 14),
              children: [
                TextSpan(text: 'Visit the'),
                TextSpan(
                  text: ' WEBTOON SHOP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                )
              ],
            ),
          ),
          Image.asset(
            ImageAssest.sangNgang,
            height: 25,
          ),
        ],
      ),
    );
  }

  Padding _getTakeFreeCoint() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Get Free Coins for inviting friends to WEBTOON!',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Image.asset(
            ImageAssest.sangNgang,
            height: 25,
          ),
        ],
      ),
    );
  }

  Container _buyCoint() {
    return Container(
      width: 100,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          'Buy Coins',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Row _textCoint() {
    return const Row(
      children: [
        Text(
          '  Purchased',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          ' 0',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          '  Free',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          ' 0',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  Row _coint() {
    return Row(
      children: [
        Image.asset(
          ImageAssest.logocoint,
          height: 40,
        ),
        const Text(
          '0',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Image.asset(
          ImageAssest.sangNgang,
          height: 40,
        )
      ],
    );
  }
}
