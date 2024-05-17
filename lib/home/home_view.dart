import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/manga_detail/manga_detai_agruments.dart';
import 'package:untitled/home/home_controller.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/router/router.dart';
import 'package:untitled/themes/theme_controller.dart';

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
    // controller.getTopMangaResponse();
    controller.getListManga();
    controller.getListTrendingManga();
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
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 25.0),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: [
                            //       TextButton(
                            //         onPressed: () {
                            //           themeController.changeTheme();
                            //         },
                            //         child: Text(
                            //           "Change Theme",
                            //           style: themeData.value.text.h14,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),

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
                                Image.asset(
                                  ImageAssest.sangNgang,
                                  height: 25,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Obx(
                              () => controller.getListMangaStatus.value ==
                                      GetListMangaStatus.loaded
                                  ? CarouselSlider(
                                      options: CarouselOptions(
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.4, // Đặt chiều cao theo chiều cao của màn hình điện thoại
                                        aspectRatio: 16 /
                                            9, // Giữ nguyên tỷ lệ khung hình 16:9
                                        viewportFraction:
                                            0.6, // Hiển thị 60% của màn hình cho mỗi mục
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.2,
                                      ),
                                      items: controller.listCaroselManga
                                          .map((item) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                                AppRouterName.mangaDetail,
                                                arguments: MangaDetailAgruments(
                                                    id: item.id));
                                          },
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    Positioned.fill(
                                                      child: Image.network(
                                                        item.panoramaMobileUrl ??
                                                            "",
                                                        fit: BoxFit
                                                            .cover, // Để ảnh vừa với khung màn hình
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        child: Text(
                                                          item.name ?? "",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16.0,
                                                            color: Colors.white,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  : const CircularProgressIndicator(),
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
                                Image.asset(
                                  ImageAssest.sangNgang,
                                  height: 25,
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Obx(
                              () => controller
                                          .getListTrendingMangaStatus.value ==
                                      GetListTrendingMangaStatus.isLoading
                                  ? const Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 90,
                                      child: ListView.builder(
                                        // shrinkWrap: true,
                                        itemCount:
                                            controller.listTrendingManga.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            Image.network(
                                          height: 90,
                                          controller.listTrendingManga[index]
                                                  .coverMobileUrl ??
                                              "",
                                        ),
                                      ),
                                    ),
                            ),
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
                                    Image.asset(
                                      ImageAssest.sangNgang,
                                      height: 25,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Container(
                                  height: 250,
                                  color: Colors.grey,
                                )
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
                                          Image.asset(
                                            ImageAssest.promotios1,
                                            fit: BoxFit.cover,
                                          ),
                                          Image.asset(
                                            ImageAssest.promotios2,
                                            fit: BoxFit.cover,
                                          ),
                                          Image.asset(
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
                            const SizedBox(
                              height: 10,
                            ),
                            _buildListImageAsetAnhCuon(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildShareAppto(),
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
        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Get.toNamed(AppRouterName.readDetail);
              },
            ),
          ),
        ),
      ]),
    );
  }

  Container _buildShareAppto() {
    return Container(
      height: 300,
      color: const Color.fromARGB(255, 213, 218, 226),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              ' Notice',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Image.asset(
              ImageAssest.sangNgang,
              height: 25,
            ),
          ],
        ),
        const Text(
          ' Unlock episodes for FREE with Reward Ads',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageAssest.logoFacebook, height: 35),
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
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text('Share app'),
            ),
          ),
        )
      ]),
    );
  }

  Container _buildListImageAsetAnhCuon() {
    return Container(
      height: 250,
      color: const Color(0xff000000),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset(
                ImageAssest.anhCuon1,
                fit: BoxFit.cover,
              ),
              Image.asset(
                ImageAssest.anhCuon2,
                fit: BoxFit.cover,
              ),
              Image.asset(
                ImageAssest.anhCuon3,
                fit: BoxFit.cover,
              ),
              Image.asset(
                ImageAssest.anhCuon4,
                fit: BoxFit.cover,
              ),
              Image.asset(
                ImageAssest.anhCuon5,
                fit: BoxFit.cover,
              ),
              Image.asset(
                ImageAssest.anhCuon6,
                fit: BoxFit.cover,
              ),
              Image.asset(
                ImageAssest.anhCuon7,
                fit: BoxFit.cover,
              ),
              Image.asset(
                ImageAssest.anhCuon8,
                fit: BoxFit.cover,
              ),
              Image.asset(
                ImageAssest.anhCuon9,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
