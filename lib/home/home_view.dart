import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/manga_detail/manga_detai_agruments.dart';
import 'package:untitled/home/home_controller.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/router/router.dart';
import 'package:untitled/themes/app_theme.dart';
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
    controller.getListSeriManga();
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
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;

    return Obx(
      () => Stack(children: [
        Scaffold(
          backgroundColor: themeData.value.color.lightBackground,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                child: SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await Future.wait([
                        controller.getTopMangaResponse(),
                        controller.getListSeriManga(),
                        controller.getListManga(),
                        controller.getListTrendingManga(),
                      ]);
                    },
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //_changeTheme(themeController, themeData),
                            const SizedBox(height: 10),
                            _logoWebtoonAndSearch(themeData),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "New Here?",
                                style: themeData.value.text.h35,
                              ),
                            ),
                            const SizedBox(height: 10),
                            _textStartWithHits(themeData),
                            const SizedBox(height: 5),
                            _listCaroselManga(context),
                            const SizedBox(height: 10),
                            _textTrendingNow(themeData),
                            const SizedBox(height: 3),
                            _listTrendingManga(),
                            const SizedBox(height: 3),
                            Column(
                              children: [
                                _textTopSeries(themeData),
                                const SizedBox(height: 3),
                                _listTopSeriesManga(),
                              ],
                            ),
                            const SizedBox(height: 3),
                            _listPromotios(themeData),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildListImageAsetAnhCuon(),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildShareAppto(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Padding _textTopSeries(Rx<AppTheme> themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }

  Padding _textTrendingNow(Rx<AppTheme> themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
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
    );
  }

  Padding _textStartWithHits(Rx<AppTheme> themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
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
    );
  }

  Column _listPromotios(Rx<AppTheme> themeData) {
    return Column(
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
            child: CarouselSlider(
              items: [
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
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enableInfiniteScroll: true,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Obx _listTopSeriesManga() {
    return Obx(
      () => controller.getListTopSeriMangaStatus.value ==
              GetListTopSeriMangaStatus.isLoading
          ? const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              ),
            )
          : SizedBox(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: controller.listTopseriManga.length,
                  itemBuilder: (context, index) {
                    final item = controller.listTopseriManga[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRouterName.mangaDetail,
                            arguments: MangaDetailAgruments(id: item.id));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 16.0),
                        height: 300,
                        width: 200,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: Image.network(
                                  controller
                                      .listTopseriManga[index].coverMobileUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(8.0))),
                                child: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }

  Obx _listTrendingManga() {
    return Obx(
      () => controller.getListTrendingMangaStatus.value ==
              GetListTrendingMangaStatus.isLoading
          ? const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Số lượng mục trên mỗi hàng
                    crossAxisSpacing:
                        10.0, // Khoảng cách giữa các mục theo trục ngang
                    mainAxisSpacing:
                        10.0, // Khoảng cách giữa các mục theo trục dọc
                    childAspectRatio:
                        0.75, // Tỉ lệ khung hình của các mục (chiều rộng / chiều cao)
                  ),
                  itemCount: controller.listTrendingManga.length,
                  itemBuilder: (context, index) {
                    final item = controller.listTrendingManga[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRouterName.mangaDetail,
                            arguments: MangaDetailAgruments(id: item.id));
                      },
                      child: Column(children: [
                        Expanded(
                            child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: Image.network(
                                  controller
                                      .listTrendingManga[index].coverMobileUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(8.0))),
                                child: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ))
                      ]),
                    );
                  }),
            ),
    );
  }

  Obx _listCaroselManga(BuildContext context) {
    return Obx(
      () => controller.getListMangaStatus.value == GetListMangaStatus.loaded
          ? CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height *
                    0.4, // Đặt chiều cao theo chiều cao của màn hình điện thoại
                aspectRatio: 16 / 9, // Giữ nguyên tỷ lệ khung hình 16:9
                viewportFraction: 0.6, // Hiển thị 60% của màn hình cho mỗi mục
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                padEnds: false,
              ),
              items: controller.listCaroselManga.map((item) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouterName.mangaDetail,
                        arguments: MangaDetailAgruments(id: item.id));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  child: Image.network(
                                    item.panoramaMobileUrl ?? "",
                                    fit: BoxFit
                                        .cover, // Để ảnh vừa với khung màn hình
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(8))),
                                  child: Text(
                                    item.name ?? "",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
          : const CircularProgressIndicator(),
    );
  }

  Padding _logoWebtoonAndSearch(Rx<AppTheme> themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImageAssest.web_toon,
            height: 60,
            width: 60,
          ),
          IconButton(
            onPressed: () {
              Get.toNamed(AppRouterName.search);
            },
            icon: Icon(
              Icons.search,
              size: 30,
              color: themeData.value.color.boldBackground,
            ),
          )
        ],
      ),
    );
  }

  // Padding _changeTheme(
  //     ThemeController themeController, Rx<AppTheme> themeData) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         TextButton(
  //           onPressed: () {
  //             themeController.changeTheme();
  //           },
  //           child: Text(
  //             "Change Theme",
  //             style: themeData.value.text.h14,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Container _buildShareAppto() {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xFFD5DAE2),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
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
      color: const Color(0x0feef7ff),
      child: Align(
        alignment: Alignment.center,
        child: CarouselSlider(
          items: [
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
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            enableInfiniteScroll: true,
          ),
        ),
      ),
    );
  }
}
