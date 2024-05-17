import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/manga_detail/manga_detai_agruments.dart';
import 'package:untitled/fearure/manga_detail/manga_detail_controller.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
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
                        Text(
                            controller.mangaDetailData.value?.team?.name ?? ''),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
