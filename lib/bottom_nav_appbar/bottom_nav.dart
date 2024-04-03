import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/bottom_nav_appbar/bottom_nav_controller.dart';
import 'package:untitled/fearure/book/book_view.dart';
import 'package:untitled/fearure/highlight/highlight_view.dart';
import 'package:untitled/fearure/my/my_view.dart';
import 'package:untitled/fearure/settings/setting_view.dart';
import 'package:untitled/home/home_view.dart';

class BottomNavigationApp extends StatelessWidget {
  final BottomNavigationController controller =
      Get.find<BottomNavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _getBody(controller.selectedIndex.value)),
      bottomNavigationBar: Obx(() => Container(
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 25)]),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.black,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 35,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.business,
                    size: 35,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.highlight,
                    size: 35,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    size: 35,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 35,
                  ),
                  label: '',
                ),
              ],
              currentIndex: controller.selectedIndex.value,
              onTap: controller.changePage,
            ),
          )),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return BookView();
      case 2:
        return HighlightView();
      case 3:
        return MyView();
      case 4:
        return SettingView();
      default:
        return Container();
    }
  }
}
