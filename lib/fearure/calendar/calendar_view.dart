import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/calendar/calendar_controller.dart';
import 'package:untitled/themes/theme_controller.dart';
import '../../images/image_extension.dart';
import 'package:intl/intl.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final _scrollController = ScrollController();
  final controller = Get.find<CalendarController>();

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
          // elevation: 0.0,
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
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.favorite,
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
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 0.4, color: Color(0xFFCFC6C6)),
                    bottom: BorderSide(width: 0.2, color: Color(0xFF5F5B5B)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: buildDayText('Mon')),
                    Expanded(child: buildDayText('Tue')),
                    Expanded(child: buildDayText('Wed')),
                    Expanded(child: buildDayText('Thu')),
                    Expanded(child: buildDayText('Fri')),
                    Expanded(child: buildDayText('Sat')),
                    Expanded(child: buildDayText('Sun')),
                  ],
                ),
              ),
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
                                          Image.asset(
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'New episodes availabel daily',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                    Image.asset(
                                      ImageAssest.sangNgang,
                                      height: 25,
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

  Widget buildDayText(String day) {
    final now = DateTime.now();
    final dayFormatter = DateFormat('E');
    final String today = dayFormatter.format(now);

    const TextStyle boldStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    return Text(
      day,
      style: TextStyle(
        fontSize: 20,
        color: day == today
            ? boldStyle.color
            : Colors
                .grey, // Tô màu xanh cho ngày hiện tại và đen cho các ngày khác
        fontWeight: day == today
            ? boldStyle.fontWeight
            : FontWeight
                .normal, // Sử dụng font weight đậm cho ngày hiện tại và font weight bình thường cho các ngày khác
      ),
    );
  }
}
