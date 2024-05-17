import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/my/my_controller.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/themes/theme_controller.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  final _scrollController = ScrollController();
  final controller = Get.find<MyController>();

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
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;

    return Obx(
      // icon buton
      () => Stack(children: [
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 115,
            automaticallyImplyLeading: false,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'My Series',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ImageAssest.logoTrash,
                          height: 40,
                          width: 40,
                        ),
                        IconButton(
                          icon: const Icon(
                            IconData(0xf4c4, fontFamily: 'MaterialIcons'),
                            size: 30,
                          ), // Icon giải thưởng
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: BorderDirectional(
                        top: BorderSide(width: 0.3, color: Color(0xFF5C5151)),
                        bottom:
                            BorderSide(width: 0.3, color: Color(0xFF5C5151)),
                      )),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '  Recent',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text('Subscribed',
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                      Text('Dowloads  ',
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: BorderDirectional(
                        bottom:
                            BorderSide(width: 0.5, color: Color(0xFF5C5151)),
                      )),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.refresh,
                            size: 20,
                            color: Colors.green,
                          ),
                          Text(' Series Total',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ],
                      ),
                      Text('Unread Series',
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                      Text('Daily Pass  ',
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                )
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
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'My Favorist',
                                      style: themeData.value.text.h25,
                                    ),
                                    Image.asset(
                                      ImageAssest.sangNgang,
                                      height: 25,
                                    ),
                                  ],
                                ),
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
