import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_ui_database/firebase_ui_database.dart';
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
    final queryFavourite =
        FirebaseDatabase.instance.ref("users/favourites").orderByChild("name");

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
                                FirebaseDatabaseQueryBuilder(
                                  query: queryFavourite,
                                  builder: (context, snapshot, _) {
                                    if (snapshot.isFetching) {
                                      return const CircularProgressIndicator();
                                    }
                                    if (snapshot.hasError) {
                                      return Text('error ${snapshot.error}');
                                    }

                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.docs.length,
                                      itemBuilder: (context, index) {
                                        // if we reached the end of the currently obtained items, we try to
                                        // obtain more items
                                        if (snapshot.hasMore &&
                                            index + 1 == snapshot.docs.length) {
                                          // Tell FirebaseDatabaseQueryBuilder to try to obtain more items.
                                          // It is safe to call this function from within the build method.
                                          snapshot.fetchMore();
                                        }

                                        final productFavourite =
                                            snapshot.docs[index].value as Map;
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: Card(
                                                child: ListTile(
                                                  title: Text(
                                                      productFavourite["name"]),
                                                  subtitle: Text(
                                                      productFavourite[
                                                              "quantity"]
                                                          .toString()),
                                                  trailing: Text(
                                                      "${productFavourite["price"]}\$"),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                              onPressed: () async {
                                                DatabaseReference favoriteRef =
                                                    FirebaseDatabase.instance.ref(
                                                        "users/favourites/${snapshot.docs[index].key}");
                                                favoriteRef
                                                    .remove()
                                                    .catchError((error) {});
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
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
                            // const SizedBox(height: 500),
                            // if (controller.getTopMangaStatus.value ==
                            //         GetTopMangaStatus.loaded ||
                            //     controller.getTopMangaStatus.value ==
                            //         GetTopMangaStatus.loadmore)
                            //   ListView.builder(
                            //       shrinkWrap: true,
                            //       physics: const NeverScrollableScrollPhysics(),
                            //       itemCount: controller.listMangaItem.length,
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
          // floatingActionButton: Obx(
          //   () => controller.getTopMangaStatus.value ==
          //           GetTopMangaStatus.isLoading
          //       ? FloatingActionButton(
          //           onPressed: () {},
          //           backgroundColor: Colors.grey,
          //           child: const CircularProgressIndicator(
          //             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          //           ),
          //         )
          //       : const SizedBox.shrink(),
          // ),
        ),
      ]),
    );
  }
}
