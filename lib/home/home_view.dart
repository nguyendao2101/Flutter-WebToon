import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/home/home_controller.dart';
import 'package:untitled/themes/theme_controller.dart';

import 'home_gruments.dart'; // Corrected import statement

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    controller.getTopMangaResponse();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.getTopMangaResponse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments as HomeAgrument;
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;
    return Stack(
      children: [
        Obx(
          () => Scaffold(
            backgroundColor: themeData.value.color.lightBackground,
            body: Center(
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: () async {
                    controller.getTopMangaResponse();
                  },
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
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
                                  )),
                            ],
                          ),
                        ),
                        if (controller.getTopMangaStatus.value ==
                                GetTopMangaStatus.loaded ||
                            controller.getTopMangaStatus.value ==
                                GetTopMangaStatus.loadmore)
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.listMangaItem.length,
                              itemBuilder: (context, index) {
                                final item = controller.listMangaItem[index];

                                return Column(
                                  children: [
                                    Image.network(item?.coverUrl ?? ""),
                                    Text(item?.name ?? ""),
                                    Text(
                                        "View count: ${item?.viewsCount ?? ""}"),
                                  ],
                                );
                              }),
                        if (controller.getTopMangaStatus.value ==
                            GetTopMangaStatus.loadmore)
                          const Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        if (controller.getTopMangaStatus.value ==
                            GetTopMangaStatus.failed)
                          const Center(
                            child: Text(
                              "Đã có lỗi xảy ra. Vui lòng thử lại!",
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Obx(
          () =>
              controller.getTopMangaStatus.value == GetTopMangaStatus.isLoading
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black.withOpacity(0.6),
                      child: const Center(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(),
                        ),
                      ))
                  : const SizedBox.shrink(),
        )
      ],
    );
  }
}
