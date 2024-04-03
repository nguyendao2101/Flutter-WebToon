import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/home/home_controller.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/themes/theme_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

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
    // final argument = Get.arguments as HomeAgrument;
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;
    // final bookController = Get.find<BookController>();

    return Obx(
      // icon buton
      () => Stack(children: [
        Scaffold(
          backgroundColor: themeData.value.color.lightBackground,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                child: SafeArea(
                  child: RefreshIndicator(
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
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
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.home,
                                  size: 32,
                                  color: Colors.blue,
                                ),
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: themeData.value.color.boldBackground,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "New Here?",
                              style: themeData.value.text.h35,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Start with hits read by Millions",
                                  style: themeData.value.text.h16,
                                ),
                                Text(
                                  ">",
                                  style: themeData.value.text.h16,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: 350,
                              color: const Color(0xFFE5E5E8),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.listMangaItem.length,
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
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 12,
                                                    height: 12,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xFF13E278),
                                                    ),
                                                    child: const Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 10,
                                                    ),
                                                  ),
                                                  Text(
                                                    " View: ${item?.viewsCount ?? ""}",
                                                    style: const TextStyle(
                                                      color: Color(0xFF13E278),
                                                    ),
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
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Trending Now ',
                                      style: themeData.value.text.h20,
                                    ),
                                    const Icon(
                                      Icons.info,
                                      color: Color(0xFFAEC0DA),
                                      size: 18,
                                    ),
                                  ],
                                ),
                                Text(
                                  ">",
                                  style: themeData.value.text.h16,
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Container(
                              height: 180,
                              color: Colors.grey,
                            ),
                            // SizedBox(
                            //   height: 180,
                            //   child: ListView.builder(
                            //     scrollDirection: Axis.horizontal,
                            //     itemCount: controller.listMangaItem.length > 20
                            //         ? 10
                            //         : controller.listMangaItem.length - 10,
                            //     itemBuilder: (context, index) {
                            //       final item = controller.listMangaItem[index + 10];
                            //       return Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //           horizontal: 5.0,
                            //         ),
                            //         child: Column(
                            //           children: [
                            //             ClipRRect(
                            //               borderRadius: BorderRadius.circular(5),
                            //               child: Image.network(
                            //                 item?.coverUrl ?? "",
                            //                 width: 100,
                            //                 height: 130,
                            //                 fit: BoxFit.cover,
                            //               ),
                            //             ),
                            //             const SizedBox(height: 5),
                            //             Text(
                            //               item?.name ?? "",
                            //               style: const TextStyle(
                            //                 fontSize: 12,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
                            const SizedBox(height: 3),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Top Series",
                                      style: themeData.value.text.h18,
                                    ),
                                    Text(
                                      ">",
                                      style: themeData.value.text.h18,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Container(
                                  height: 250,
                                  color: Colors.grey,
                                )
                                // Container(
                                //   height: 50, // Chiều cao cố định
                                //   child: Row(
                                //     children: List.generate(
                                //       5, // Chỉ hiển thị 5 truyện
                                //       (index) {
                                //         final item = controller.listMangaItem[index + 30];
                                //         return Padding(
                                //           padding:
                                //               const EdgeInsets.symmetric(horizontal: 5.0),
                                //           child: Column(
                                //             crossAxisAlignment: CrossAxisAlignment.start,
                                //             children: [
                                //               Row(
                                //                 children: [
                                //                   ClipRRect(
                                //                     borderRadius:
                                //                         BorderRadius.circular(5),
                                //                     child: Image.network(
                                //                       item?.coverUrl ?? "",
                                //                       width: 40,
                                //                       height: 40,
                                //                       fit: BoxFit.cover,
                                //                     ),
                                //                   ),
                                //                   const SizedBox(width: 5),
                                //                   Expanded(
                                //                     child: Text(
                                //                       item?.name ?? "",
                                //                       style: const TextStyle(
                                //                         fontSize: 12,
                                //                         color: Colors.black,
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //               const SizedBox(height: 10),
                                //             ],
                                //           ),
                                //         );
                                //       },
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Promotios',
                                  style: themeData.value.text.h25,
                                ),
                                Container(
                                  height: 250,
                                  color: const Color(0xff000000),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      child: PageView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Image.network(
                                            ImageAssest.promotios1,
                                            fit: BoxFit.cover,
                                          ),
                                          Image.network(
                                            ImageAssest.promotios2,
                                            fit: BoxFit.cover,
                                          ),
                                          Image.network(
                                            ImageAssest.promotios3,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Daily',
                                      style: themeData.value.text.h25,
                                    ),
                                    Text(
                                      '>',
                                      style: themeData.value.text.h25,
                                    )
                                  ],
                                ),
                                Container(
                                  height: 250,
                                  color: Colors.grey,
                                )
                                // Container(
                                //   height: 250,
                                //   color: Color(0xFFE5E5E8),
                                //   child: GridView.count(
                                //     crossAxisCount: 3, // Số cột trong grid
                                //     crossAxisSpacing: 20, // Khoảng cách giữa các cột
                                //     mainAxisSpacing: 0, // Khoảng cách giữa các hàng
                                //     shrinkWrap: true,
                                //     physics: const NeverScrollableScrollPhysics(),
                                //     children: List.generate(
                                //       6, // Số lượng item trong grid
                                //       (index) {
                                //         final item = controller.listMangaItem[
                                //             index + 40]; // Lấy từ vị trí 40 đến 45
                                //         return Padding(
                                //           padding: const EdgeInsets.all(8.0),
                                //           child: Column(
                                //             children: [
                                //               ClipRRect(
                                //                 borderRadius: BorderRadius.circular(5),
                                //                 child: Image.network(
                                //                   item?.coverUrl ?? "",
                                //                   width: 70, // Kích thước ảnh
                                //                   height: 70, // Kích thước ảnh
                                //                   fit: BoxFit.cover,
                                //                 ),
                                //               ),
                                //               const SizedBox(
                                //                   height:
                                //                       5), // Khoảng cách giữa ảnh và chữ
                                //               // Text(
                                //               //   item?.name ?? "",
                                //               //   style: const TextStyle(
                                //               //     fontWeight: FontWeight.bold,
                                //               //     fontSize: 12,
                                //               //     color: Colors.black,
                                //               //   ),
                                //               // ),
                                //               const SizedBox(
                                //                   height:
                                //                       2), // Khoảng cách giữa chữ và icon check
                                //               Row(
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment.center,
                                //                 children: [
                                //                   Container(
                                //                     width: 12,
                                //                     height: 12,
                                //                     decoration: const BoxDecoration(
                                //                       shape: BoxShape.circle,
                                //                       color: Color(0xFF13E278),
                                //                     ),
                                //                     child: const Icon(
                                //                       Icons.check,
                                //                       color: Colors.white,
                                //                       size: 10,
                                //                     ),
                                //                   ),
                                //                   const SizedBox(
                                //                       width:
                                //                           3), // Khoảng cách giữa icon check và số lượt xem
                                //                   Text(
                                //                     " ${item?.viewsCount ?? ""}",
                                //                     style: const TextStyle(
                                //                       color: Color(0xFF13E278),
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           ),
                                //         );
                                //       },
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 250,
                              color: const Color(0xff000000),
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  child: PageView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Image.network(
                                        ImageAssest.anhCuon1,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon2,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon3,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon4,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon5,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon6,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon7,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon8,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon9,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon10,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon11,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.network(
                                        ImageAssest.anhCuon12,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 300,
                              color: const Color.fromARGB(255, 213, 218, 226),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ' Notice',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          '>',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      ' Unlock episodes for FREE with Reward Ads',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(ImageAssest.logoFacebook,
                                            height: 35),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Image.asset(
                                          ImageAssest.logoInstagram,
                                          height: 60,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Image.asset(
                                          ImageAssest.logoTwiter,
                                          height: 60,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Image.asset(
                                          ImageAssest.logoYoutube,
                                          height: 45,
                                        ) // Thêm dấu phẩy vào đây
                                      ], // Không cần dấu chấm phẩy sau ngoặc vuông này
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 90,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Center(
                                          child: Text('Share app'),
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                            // const SizedBox(height: 500),
                            if (controller.getTopMangaStatus.value ==
                                    GetTopMangaStatus.loaded ||
                                controller.getTopMangaStatus.value ==
                                    GetTopMangaStatus.loadmore)
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
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
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Obx(
            () => controller.getTopMangaStatus.value ==
                    GetTopMangaStatus.isLoading
                ? FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.grey,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ]),
    );
  }
}
