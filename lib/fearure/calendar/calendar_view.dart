import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/calendar/calendar_controller.dart';
import 'package:untitled/fearure/manga_detail/manga_detai_agruments.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/router/router.dart';
import 'package:untitled/themes/theme_controller.dart';
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
  void initState() {
    super.initState();
    controller.getListTrendingManga();
    controller.getListUpdateNewManga();
  }

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
                          await Future.wait([
                            controller.getListTrendingManga(),
                            controller.getListUpdateNewManga(),
                          ]);
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
                                Obx(
                                  () => controller.getListTrendingMangaStatus
                                              .value ==
                                          GetListTrendingMangaStatus.isLoading
                                      ? const Center(
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    3, // Số lượng mục trên mỗi hàng
                                                crossAxisSpacing:
                                                    10.0, // Khoảng cách giữa các mục theo trục ngang
                                                mainAxisSpacing:
                                                    10.0, // Khoảng cách giữa các mục theo trục dọc
                                                childAspectRatio:
                                                    0.75, // Tỉ lệ khung hình của các mục (chiều rộng / chiều cao)
                                              ),
                                              itemCount: controller
                                                  .listTrendingManga.length,
                                              itemBuilder: (context, index) {
                                                final item = controller
                                                    .listTrendingManga[index];
                                                return GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        AppRouterName
                                                            .mangaDetail,
                                                        arguments:
                                                            MangaDetailAgruments(
                                                                id: item.id));
                                                  },
                                                  child: Column(children: [
                                                    Expanded(
                                                        child: Stack(
                                                      children: [
                                                        Positioned.fill(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                                    Radius.circular(
                                                                        8.0)),
                                                            child:
                                                                Image.network(
                                                              controller
                                                                  .listTrendingManga[
                                                                      index]
                                                                  .coverMobileUrl,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5),
                                                                borderRadius: const BorderRadius
                                                                    .vertical(
                                                                    bottom: Radius
                                                                        .circular(
                                                                            8.0))),
                                                            child: Text(
                                                              item.name,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 16.0,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ))
                                                  ]),
                                                );
                                              }),
                                        ),
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
