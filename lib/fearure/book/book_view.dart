import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/book/book_controller.dart';
import 'package:untitled/themes/theme_controller.dart';

import '../../images/image_extension.dart';

class BookView extends StatefulWidget {
  const BookView({Key? key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  final _scrollController = ScrollController();
  final controller = Get.find<BookController>();

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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Daily',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' | Genres',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.emoji_events,
                          size: 30,
                        ), // Icon giải thưởng
                        onPressed: () {},
                      ),
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
              Container(
                height: 35,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFF5F5B5B)),
                      bottom: BorderSide(width: 1.0, color: Color(0xFF5F5B5B)),
                    )),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '  MON',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'TUE',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'WEB',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'THU',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'FRI',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'SAT',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'SUN  ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Obx(
          () => Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  SliverFillRemaining(
                    child: SafeArea(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          // controller.getTopMangaResponse();
                        },
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 300,
                                  color: Colors.brown,
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 70,
                                  color: const Color(0xff000000),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      child: PageView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Image.network(
                                            ImageAssest.book1,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 200,
                                  color: Colors.orange,
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 200,
                                  color: Colors.red,
                                ),
                                const SizedBox(height: 5),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'New episodes availabel daily',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '>',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 200,
                                  color: Colors.white,
                                ),
                                // if (controller.getTopMangaStatus.value ==
                                //         GetTopMangaStatus.loaded ||
                                //     controller.getTopMangaStatus.value ==
                                //         GetTopMangaStatus.loadmore)
                                //   ListView.builder(
                                //       shrinkWrap: true,
                                //       physics:
                                //           const NeverScrollableScrollPhysics(),
                                //       itemCount:
                                //           controller.listMangaItem.length,
                                //       itemBuilder: (context, index) {
                                //         final item =
                                //             controller.listMangaItem[index];

                                //         return Column(
                                //           children: [
                                //             Image.network(item?.coverUrl ?? ""),
                                //             Text(item?.name ?? ""),
                                //             Text(
                                //                 "View count: ${item?.viewsCount ?? ""}"),
                                //           ],
                                //         );
                                //       }),
                                // if (controller.getTopMangaStatus.value ==
                                //     GetTopMangaStatus.loadmore)
                                //   const Center(
                                //     child: SizedBox(
                                //       width: 50,
                                //       height: 50,
                                //       child: CircularProgressIndicator(),
                                //     ),
                                //   ),
                                // if (controller.getTopMangaStatus.value ==
                                //     GetTopMangaStatus.failed)
                                //   const Center(
                                //     child: Text(
                                //       "Đã có lỗi xảy ra. Vui lòng thử lại!",
                                //     ),
                                //   )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   right: 0,
              //   child: SizedBox(
              //     height: kToolbarHeight, // Height of your app bar
              //     child: AppBar(
              //       backgroundColor: const Color(0xff265073),
              //       automaticallyImplyLeading: false,
              //       actions: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             IconButton(
              //                 onPressed: () {
              //                   controller.goToHome();
              //                 },
              //                 icon: const Icon(
              //                   Icons.favorite,
              //                   color: Color(0xFFCEC6C6),
              //                   size: 40,
              //                 )),
              //             const SizedBox(
              //               width: 25,
              //             ),
              //             IconButton(
              //                 onPressed: () {},
              //                 icon: const Icon(
              //                   Icons.menu_book,
              //                   color: Color(0xFFCEC6C6),
              //                   size: 40,
              //                 )),
              //             const SizedBox(
              //               width: 25,
              //             ),
              //             IconButton(
              //                 onPressed: () {
              //                   controller.goToHightlight();
              //                 },
              //                 icon: const Icon(
              //                   Icons.highlight,
              //                   color: Color(0xFFCEC6C6),
              //                   size: 40,
              //                 )),
              //             const SizedBox(
              //               width: 25,
              //             ),
              //             IconButton(
              //                 onPressed: () {
              //                   controller.goToMy();
              //                 },
              //                 icon: const Icon(
              //                   Icons.account_circle,
              //                   color: Color(0xFFCEC6C6),
              //                   size: 40,
              //                 )),
              //             const SizedBox(
              //               width: 25,
              //             ),
              //             IconButton(
              //                 onPressed: () {
              //                   controller.goToSetting();
              //                 },
              //                 icon: const Icon(
              //                   Icons.settings,
              //                   color: Color(0xFFCEC6C6),
              //                   size: 40,
              //                 )),
              //             const SizedBox(
              //               width: 18,
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        // floatingActionButton: Obx(
        //   () =>
        //       controller.getTopMangaStatus.value == GetTopMangaStatus.isLoading
        //           ? FloatingActionButton(
        //               onPressed: () {},
        //               backgroundColor: Colors.grey,
        //               child: const CircularProgressIndicator(
        //                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        //               ),
        //             )
        //           : const SizedBox.shrink(),
        // ),
      ),
    );
  }
}
