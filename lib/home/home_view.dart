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
            body: SafeArea(
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: () async {
                    controller.getTopMangaResponse();
                  },
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.home,
                                size: 32,
                                color: Colors.blue,
                              ),
                              Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.black,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // new here
                          const Text(
                            "New Here?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.black),
                          ),
                          // Start with hits read by Millions
                          Container(
                            height: 350,
                            color: const Color(0xFFE5E5E8),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Start with hits read by Millions",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      ">",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 300,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.listMangaItem.length,
                                    itemBuilder: (context, index) {
                                      final item =
                                          controller.listMangaItem[index];

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.network(
                                                item?.coverUrl ?? "",
                                                width: 200,
                                                height: 250,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              item?.name ?? "",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 12,
                                                  height: 12,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(
                                                        0xFF13E278), // Màu nền của hình tròn
                                                  ),
                                                  child: const Icon(
                                                    Icons.check, // Icon tích
                                                    color: Colors
                                                        .white, // Màu của icon
                                                    size:
                                                        10, // Kích thước của icon
                                                  ),
                                                ),
                                                Text(
                                                  " View: ${item?.viewsCount ?? ""}",
                                                  style: const TextStyle(
                                                      color: Color(0xFF13E278)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Trending Now
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Trending Now ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.info,
                                    color: Color(0xFFAEC0DA),
                                    size: 18,
                                  ),
                                ],
                              ),
                              Text(
                                ">",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 180,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.listMangaItem.length > 20
                                  ? 10
                                  : controller.listMangaItem.length - 10,
                              itemBuilder: (context, index) {
                                final item =
                                    controller.listMangaItem[index + 10];

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          item?.coverUrl ?? "",
                                          width: 100,
                                          height: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        item?.name ?? "",
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          // Top series
                          Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Top Series",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    ">",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.listMangaItem.length >
                                          40
                                      ? 5
                                      : controller.listMangaItem.length - 30,
                                  itemBuilder: (context, index) {
                                    final item =
                                        controller.listMangaItem[index + 30];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  item?.coverUrl ?? "",
                                                  width: 40,
                                                  height: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                item?.name ?? "",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller.listMangaItem.length,
                                    itemBuilder: (context, index) {
                                      final item =
                                          controller.listMangaItem[index];

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
                        ],
                      ),
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
