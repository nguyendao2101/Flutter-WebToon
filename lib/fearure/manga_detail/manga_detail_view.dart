import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/manga_detail/manga_detai_agruments.dart';
import 'package:untitled/fearure/manga_detail/manga_detail_controller.dart';
import 'package:untitled/fearure/read_detail/read_detail_argument.dart';
import 'package:untitled/router/router.dart';

class MangaDetailPage extends StatefulWidget {
  const MangaDetailPage({super.key});

  @override
  State<MangaDetailPage> createState() => _MangaDetailPageState();
}

class _MangaDetailPageState extends State<MangaDetailPage> {
  final argument = Get.arguments as MangaDetailAgruments;
  final controller = Get.put(MangaDetailController());

  @override
  void initState() {
    controller.getMangaDetailData(argument.id);
    controller.getListChapters(argument.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Get.toNamed(AppRouterName.readDetail);
        //   },
        //   child: const Icon(Icons.ad_units),
        // ),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: controller.getMangaDetailStatus.value ==
                            GetMangaDetailStatus.isLoading
                        ? const Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: Image.network(controller.mangaDetailData
                                        .value?.coverMobileUrl ??
                                    ""),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                controller.mangaDetailData.value?.name ?? '',
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.mangaDetailData.value?.description ??
                                    '',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                controller.mangaDetailData.value?.team?.name ??
                                    '',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.getListChapterData.length,
                    itemBuilder: (context, index) {
                      final item = controller.getListChapterData[index];

                      return ListTile(
                        title: Text("Chapter ${index + 1}: ${item.name}"),
                        onTap: () {
                          Get.toNamed(
                            AppRouterName.readDetail,
                            arguments: ReadDetailArgument(
                              id: item.id,
                              listChapter: controller.getListChapterData,
                              index: index,
                            ),
                          );
                        },
                      );
                    },
                    shrinkWrap: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
