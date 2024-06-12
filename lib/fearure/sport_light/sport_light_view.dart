import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/sport_light/sport_light_controller.dart';
import 'package:untitled/fearure/manga_detail/manga_detai_agruments.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/router/router.dart';
import 'package:untitled/themes/app_theme.dart';
import 'package:untitled/themes/theme_controller.dart';

class SportLightView extends StatefulWidget {
  const SportLightView({super.key});

  @override
  State<SportLightView> createState() => _SportLightViewState();
}

class _SportLightViewState extends State<SportLightView> {
  final _scrollController = ScrollController();
  final controller = Get.find<SportLightController>();

  @override
  void initState() {
    super.initState();
    controller.getListRecommentdedSeries();
    controller.getListWeekyHot();
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
          appBar: AppBar(
            backgroundColor: themeData.value.color.lightBackground,
            toolbarHeight: 60,
            automaticallyImplyLeading: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textAndIconAppbar(themeData),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey[100],
                ),
              ],
            ),
          ),
          backgroundColor: themeData.value.color.lightBackground,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                child: SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await Future.wait([
                        controller.getListRecommentdedSeries(),
                        controller.getListWeekyHot(),
                      ]);
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

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text(
                                  'Recommended Series',
                                  style: themeData.value.text.h20,
                                ),
                                const SizedBox(height: 16),
                                _listRecommendedSeries(),
                                const SizedBox(height: 16),
                                _pictureIntro(),
                              ],
                            ),
                            const SizedBox(height: 16),

                            Column(
                              children: [
                                _textWeekyHot(themeData),
                                const SizedBox(height: 16),
                                _listWeekyHot()
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            _pictureAsianFacific(),
                            const SizedBox(
                              height: 16,
                            ),
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

  Container _pictureAsianFacific() {
    return Container(
      height: 80,
      color: const Color(0xff000000),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset(
                ImageAssest.asianFacific,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }

  Obx _listWeekyHot() {
    return Obx(
      () => controller.getListWeekyHotMangaStatus.value ==
              GetListWeekyHotMangaStatus.isLoading
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
                  itemCount: controller.listWeekyHotManga.length,
                  itemBuilder: (context, index) {
                    final item = controller.listWeekyHotManga[index];
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
                                      .listWeekyHotManga[index].coverMobileUrl,
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

  Row _textWeekyHot(Rx<AppTheme> themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Weeky HOT',
          style: themeData.value.text.h20,
        ),
        Image.asset(
          ImageAssest.sangNgang,
          height: 25,
        ),
      ],
    );
  }

  Container _pictureIntro() {
    return Container(
      height: 80,
      color: const Color(0xff000000),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset(
                ImageAssest.hight1,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }

  Obx _listRecommendedSeries() {
    return Obx(
      () => controller.getListRecommendedMangaStatus.value ==
              GetListRecommendedMangaStatus.isLoading
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
                  itemCount: controller.listRecommendedManga.length,
                  itemBuilder: (context, index) {
                    final item = controller.listRecommendedManga[index];
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
                                  controller.listRecommendedManga[index]
                                      .coverMobileUrl,
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

  Column _textAndIconAppbar(Rx<AppTheme> themeData) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Spotlight',
                  style: themeData.value.text.h25,
                ),
                const Text(
                  ' | Genres',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(AppRouterName.search);
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
