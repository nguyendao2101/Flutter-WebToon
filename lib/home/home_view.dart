import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/home/home_controller.dart';
import 'package:untitled/themes/theme_controller.dart';

import 'home_gruments.dart'; // Corrected import statement

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
    final argument = Get.arguments as HomeAgrument;
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;

    return Scaffold(
      backgroundColor: themeData.value.color.lightBackground,
      body: SafeArea(
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
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.home,
                        size: 32,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "New Here?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 350,
                    color: const Color(0xFFE5E5E8),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Start with hits read by Millions",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ">",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.listMangaItem.length,
                            itemBuilder: (context, index) {
                              final item = controller.listMangaItem[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
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
                                          decoration: const BoxDecoration(
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Trending Now ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.info,
                            color: Color(0xFFAEC0DA),
                            size: 18,
                          ),
                        ],
                      ),
                      Text(
                        ">",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listMangaItem.length > 20
                          ? 10
                          : controller.listMangaItem.length - 10,
                      itemBuilder: (context, index) {
                        final item = controller.listMangaItem[index + 10];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  item?.coverUrl ?? "",
                                  width: 100,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item?.name ?? "",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  // Column(
                  //   children: [
                  //     const Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           "Top Series",
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 18,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //         Text(
                  //           ">",
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 18,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Container(
                  //       height: 50, // Chiều cao cố định
                  //       child: Row(
                  //         children: List.generate(
                  //           5, // Chỉ hiển thị 5 truyện
                  //           (index) {
                  //             final item = controller.listMangaItem[index + 30];
                  //             return Padding(
                  //               padding:
                  //                   const EdgeInsets.symmetric(horizontal: 5.0),
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Row(
                  //                     children: [
                  //                       ClipRRect(
                  //                         borderRadius:
                  //                             BorderRadius.circular(5),
                  //                         child: Image.network(
                  //                           item?.coverUrl ?? "",
                  //                           width: 40,
                  //                           height: 40,
                  //                           fit: BoxFit.cover,
                  //                         ),
                  //                       ),
                  //                       const SizedBox(width: 5),
                  //                       Expanded(
                  //                         child: Text(
                  //                           item?.name ?? "",
                  //                           style: const TextStyle(
                  //                             fontSize: 12,
                  //                             color: Colors.black,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   const SizedBox(height: 10),
                  //                 ],
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Promotios',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black),
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
                                  'https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/431075083_1472881296601388_6372964892764379321_n.png?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH93vmTdvEPm7lEis7MRdlEaHEyrdcGuDZocTKt1wa4Nk5WaI5E0940YbAWhQzbml6e9hIKy8tpVOwBWKwaw3cV&_nc_ohc=vkEcoWPTquMAX9Ez8wi&_nc_ht=scontent.fhan14-1.fna&cb_e2o_trans=q&oh=03_AdQWXu9MXX10V5PRkCAO1MtZNMd_thO8Lqv8CRrCiogiYw&oe=661A8329',
                                  fit: BoxFit.cover,
                                ),
                                Image.network(
                                  'https://scontent.fhan14-5.fna.fbcdn.net/v/t1.15752-9/432754453_1369992907732078_4137288603216997532_n.png?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFymjBuQC88BxhPM9vhgOK3cLB3i43zBtdwsHeLjfMG1xgjgbIkHCsAGuQQ-7upYUT_uHjwP8q0X_S5PardupmZ&_nc_ohc=7g0RKiJaB0wAX8EkUai&_nc_ht=scontent.fhan14-5.fna&cb_e2o_trans=q&oh=03_AdRaOjRnmw6UwHiGvAEHWoQo6t9AxyMq7-TjR5zk7jv5yg&oe=661A9EEC',
                                  fit: BoxFit.cover,
                                ),
                                Image.network(
                                  'https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/431132888_887783093148373_7005552339630218460_n.png?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGEeghNSylSQweJyfH_NnOgr6C1pg2rqNevoLWmDauo18xXzOFsixhdr4rFuyPevISNMsVVQk_G-K0Kl0wh_BQx&_nc_ohc=--_Zoi-5xmAAX_8UPvB&_nc_ht=scontent.fhan14-1.fna&cb_e2o_trans=q&oh=03_AdRn15pVRVmCPKgFOda3uqMF4KwBQN5slaD2txm3Kez3CQ&oe=661A9378',
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 10),
                  // Column(
                  //   children: [
                  //     const Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           'Daily',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 24,
                  //               color: Colors.black),
                  //         ),
                  //         Text(
                  //           '>',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 20,
                  //               color: Colors.black),
                  //         )
                  //       ],
                  //     ),
                  //     Container(
                  //       height: 250,
                  //       color: Color(0xFFE5E5E8),
                  //       child: GridView.count(
                  //         crossAxisCount: 3, // Số cột trong grid
                  //         crossAxisSpacing: 20, // Khoảng cách giữa các cột
                  //         mainAxisSpacing: 0, // Khoảng cách giữa các hàng
                  //         shrinkWrap: true,
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         children: List.generate(
                  //           6, // Số lượng item trong grid
                  //           (index) {
                  //             final item = controller.listMangaItem[
                  //                 index + 40]; // Lấy từ vị trí 40 đến 45
                  //             return Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Column(
                  //                 children: [
                  //                   ClipRRect(
                  //                     borderRadius: BorderRadius.circular(5),
                  //                     child: Image.network(
                  //                       item?.coverUrl ?? "",
                  //                       width: 70, // Kích thước ảnh
                  //                       height: 70, // Kích thước ảnh
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                   ),
                  //                   const SizedBox(
                  //                       height:
                  //                           5), // Khoảng cách giữa ảnh và chữ
                  //                   // Text(
                  //                   //   item?.name ?? "",
                  //                   //   style: const TextStyle(
                  //                   //     fontWeight: FontWeight.bold,
                  //                   //     fontSize: 12,
                  //                   //     color: Colors.black,
                  //                   //   ),
                  //                   // ),
                  //                   const SizedBox(
                  //                       height:
                  //                           2), // Khoảng cách giữa chữ và icon check
                  //                   Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.center,
                  //                     children: [
                  //                       Container(
                  //                         width: 12,
                  //                         height: 12,
                  //                         decoration: const BoxDecoration(
                  //                           shape: BoxShape.circle,
                  //                           color: Color(0xFF13E278),
                  //                         ),
                  //                         child: const Icon(
                  //                           Icons.check,
                  //                           color: Colors.white,
                  //                           size: 10,
                  //                         ),
                  //                       ),
                  //                       const SizedBox(
                  //                           width:
                  //                               3), // Khoảng cách giữa icon check và số lượt xem
                  //                       Text(
                  //                         " ${item?.viewsCount ?? ""}",
                  //                         style: const TextStyle(
                  //                           color: Color(0xFF13E278),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
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
                              'https://scontent.fhan14-5.fna.fbcdn.net/v/t1.15752-9/430869971_231014466701102_5210028675073468722_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFipwxvdwB6ZQG6k7bsutNoSra1qp3QyJBKtrWqndDIkPWCvt7YHyLR345e91D_NSbds3IaTGwRvBI3y80lTOId&_nc_ohc=y5LOPwFXMEAAX_a4lBV&_nc_ht=scontent.fhan14-5.fna&cb_e2o_trans=q&oh=03_AdSwWTs6CSfRLVOfPahhf7aHBZj4aIUG1GFRsm98D9WAmg&oe=661AA10F',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-4.fna.fbcdn.net/v/t1.15752-9/431030059_1200437057602881_7693257017102289690_n.png?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF0xN3qtMzHYbgdVFnDn_aSJz-YfaP6MdAnP5h9o_ox0FIOFwmJMqKfGYHKMT1BAGk6mURwY2CBPf2IgwZWBM-Q&_nc_ohc=1Q4iZ_h-6ZwAX_7MkdE&_nc_ht=scontent.fhan14-4.fna&cb_e2o_trans=q&oh=03_AdSuMUlOdr3k79N3eK_9zZ3SGM6eurhLNvA86ARgookFJw&oe=661AAD0A',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/431136580_1911801195942923_8609094317917994783_n.png?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHQKuIOItY4X-RMTQP0citmCaMdkxBhA8AJox2TEGEDwIV14W0ciEOEx77r_k4XmmA8zxwuz4QVyXlg8Jm9bubv&_nc_ohc=QqXsuu6-8fAAX8ADZ6e&_nc_ht=scontent.fhan14-2.fna&cb_e2o_trans=q&oh=03_AdRvStH-o-cL7vw8Hx324OQhv24u8hMrpDHv9rqj6FbJlQ&oe=661AC7AC',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-5.fna.fbcdn.net/v/t1.15752-9/431214689_797028261948576_8275306005815698130_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFVd6d-5ttXIwq9aPCpMq8Fqn9zqBBE5UWqf3OoEETlRRAOUUco5udWUivn0x02JhORV6xB9BtDNAAG_qIeifoK&_nc_ohc=uon7abqk4lEAX9KUGtZ&_nc_ht=scontent.fhan14-5.fna&cb_e2o_trans=q&oh=03_AdQ6cqEDjmz_65jqVrFhBqpqdXLhiZpDZ5cZZEv1jEvojw&oe=661ACDEB',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/430978429_1937742476623888_1578793461174428407_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFBUET-jurTk9BdGtmaXcyw2pJ7vmPlDjzaknu-Y-UOPOjaCJ8t1GQlghbpxfa1BUm_dOjRpucA5Vey47EfFy-A&_nc_ohc=4CB0mNpYRJAAX9SCIV-&_nc_ht=scontent.fhan14-1.fna&cb_e2o_trans=q&oh=03_AdTzS7q_7-fYwfTwM2BAarbTq4hD8bbuMg6X6PRnw46bMw&oe=661ACEAA',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/431058902_1607930716622261_2903969907288449569_n.png?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHtodDo16vwt9lJz5rt1A9fEFX0sIhP9PUQVfSwiE_09cndkGKEKh93f7ZyuKBWgeolsN2zNps3NkYFpPldadtd&_nc_ohc=712rqXGrR8oAX-HzRmI&_nc_ht=scontent.fhan14-1.fna&cb_e2o_trans=q&oh=03_AdTLbbRcYWcBUWXoq3JNZsfHRMJJ6tZx6f5MRA_odCUUEw&oe=661AC388',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/431057763_771680134925902_5872440588128354718_n.png?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHEx0f_e3yPceBJzXry5WZHkjW1XooOwleSNbVeig7CV_LCxcbPtAUm51fdXaY2SYxPGjPDmQpyqOJ6vRC8aA1R&_nc_ohc=3vOd0-6NW54AX_ia674&_nc_ht=scontent.fhan14-2.fna&cb_e2o_trans=q&oh=03_AdTOf8nuYDXWgkjrRjk9_wMlUjvCPNn5XWR-mZyiz7JiJw&oe=661ACD98',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-3.fna.fbcdn.net/v/t1.15752-9/430974473_256435204196062_2478425544478076324_n.png?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGyNvfKf9lpjz5dLYThuVXYjMEAoEe-qOiMwQCgR76o6LZ1IhBnchZFdmscrGjNeK2pcDgGkNIK0rlJY7zL03gN&_nc_ohc=FQ63rV1-e5IAX9q06Rq&_nc_ht=scontent.fhan14-3.fna&cb_e2o_trans=q&oh=03_AdT_ZFbASQwQTjKF1wJCo2lmmUB1fcSITouuewrVT6uvlw&oe=661ACB6D',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-2.fna.fbcdn.net/v/t1.15752-9/430947180_330049576241840_5250869654116213588_n.png?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGKXQSnE8Om4EZ-CRaushUS6l9YXFXSIODqX1hcVdIg4PX-hj6H2Eue0shytEy8kjEu2hZicPB_wBKoI7tJEoKl&_nc_ohc=UhCg186OxHwAX9zmXV-&_nc_ht=scontent.fhan14-2.fna&cb_e2o_trans=q&oh=03_AdR_Ar7OhgiY_cBXWNl5xBOPuX6xcpd3oAc5ytgJw0NKfA&oe=661AA6F0',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-1.fna.fbcdn.net/v/t1.15752-9/430874210_786325180021280_1068413932041537061_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGjQxfJldKTc4mA5EeTwrHgvZHm25wp6DK9kebbnCnoMhYqwWNEpBGc1wYuC6cR0L9JYnUL6E81X3MleSVhOaZo&_nc_ohc=sU6Y2zZXwTAAX8JuKKa&_nc_ht=scontent.fhan14-1.fna&cb_e2o_trans=q&oh=03_AdQ7GtphaUnb2FO6Lc0_NzmARvcTbYyHxmgSmI4-QroS3w&oe=661AC14A',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-4.fna.fbcdn.net/v/t1.15752-9/431198735_272311179149079_302687983731569588_n.png?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH5aV7Qp9vnYKy9Wokw2EGuou8nF86vn4Oi7ycXzq-fg3yM4TeiXIIQW-lWNwwm3tt_FlOeMtM8M2cWlNSYNWFy&_nc_ohc=k2erBo3VWhgAX8Li1aL&_nc_ht=scontent.fhan14-4.fna&cb_e2o_trans=q&oh=03_AdS5xrOx6g8mQVcsaTn1xUAOpmo-Jx-9lgN0Q-kn8P69Gg&oe=661AD4F2',
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://scontent.fhan14-5.fna.fbcdn.net/v/t1.15752-9/431117206_376050982057427_5153244848311826958_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHnH72zKhNcYeJ5q1wq3c5-xeP5c_5xBG7F4_lz_nEEblCJH-d1jnBFHlJTIImVwdKOSB50xff-Z9Us2Lbi2Z9L&_nc_ohc=ee1FHvy6v-AAX8Jz967&_nc_ht=scontent.fhan14-5.fna&cb_e2o_trans=q&oh=03_AdRVe8aWWdZBLGKlB848mbZ3rtqAbLLoOA6Kugo38S33eg&oe=661ACB14',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 500),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  if (controller.getTopMangaStatus.value ==
                          GetTopMangaStatus.loaded ||
                      controller.getTopMangaStatus.value ==
                          GetTopMangaStatus.loadmore)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.listMangaItem.length,
                      itemBuilder: (context, index) {
                        final item = controller.listMangaItem[index];
                        return Column(
                          children: [
                            Image.network(item?.coverUrl ?? ""),
                            Text(item?.name ?? ""),
                            Text("View count: ${item?.viewsCount ?? ""}"),
                          ],
                        );
                      },
                    ),
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
      floatingActionButton: Obx(
        () => controller.getTopMangaStatus.value == GetTopMangaStatus.isLoading
            ? FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.grey,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
