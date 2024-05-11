import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.toNamed(AppRouterName.readDetail);
      //   },
      //   child: const Icon(Icons.ad_units),
      // ),
      body: Obx(
        () => SingleChildScrollView(
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
                          Text(controller.mangaDetailData.value?.name ?? ''),
                          Text(controller.mangaDetailData.value?.description ??
                              ''),
                          Text(controller.mangaDetailData.value?.team?.name ??
                              ''),
                        ],
                      ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.getListChapterData.length,
                itemBuilder: (context, index) {
                  final item = controller.getListChapterData[index];

                  return ListTile(
                    title: Text(item.name),
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
    );
  }
}
