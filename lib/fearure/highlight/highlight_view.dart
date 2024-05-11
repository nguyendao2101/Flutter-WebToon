import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/highlight/highlight_controller.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/themes/theme_controller.dart';

class HighlightView extends StatefulWidget {
  const HighlightView({super.key});

  @override
  State<HighlightView> createState() => _HighlightViewState();
}

class _HighlightViewState extends State<HighlightView> {
  final _scrollController = ScrollController();
  final controller = Get.find<HighlightController>();

  @override
  // void initState() {
  //   super.initState();
  //   controller.getTopMangaResponse();
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       controller.getTopMangaResponse();
  //     }
  //   });
  // }

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
            toolbarHeight: 60,
            automaticallyImplyLeading: false,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Spotlight',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
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
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                          ), // Icon giải thưởng
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
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
                      // controller.getTopMangaResponse();
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
                                Text(
                                  'Recommended Series',
                                  style: themeData.value.text.h20,
                                ),
                                const SizedBox(height: 5),
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
                                const SizedBox(height: 30),
                                Container(
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
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                ),
                                Container(
                                  height: 250,
                                  color: Colors.grey,
                                )
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
}
