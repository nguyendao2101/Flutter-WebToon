import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/read_detail/read_detail_argument.dart';
import 'package:untitled/fearure/read_detail/read_detail_controller.dart';
import 'package:untitled/images/image_extension.dart';
import 'package:untitled/router/router.dart';
import 'package:untitled/themes/theme_controller.dart';

class ReadDetailView extends StatefulWidget {
  const ReadDetailView({Key? key}) : super(key: key);

  @override
  State<ReadDetailView> createState() => _ReadDetailViewState();
}

class _ReadDetailViewState extends State<ReadDetailView> {
  final controller = Get.find<ReadDetailController>();
  final argument = Get.arguments as ReadDetailArgument;

  @override
  void initState() {
    controller.getChapterDetailData(argument.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.value.color.lightBackground,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        // elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _priveousChapter(),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(AppRouterName.bottomnav);
                },
                child: Image.asset(
                  ImageAssest.web_toon,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
            _listchapter(),
            _nextChapter(),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.chapterDetailData.value?.pages.length ?? 0,
                    itemBuilder: (context, index) {
                      final item =
                          controller.chapterDetailData.value?.pages[index];
                      return Image.network(item?.imageUrl ?? '');
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Flexible _nextChapter() {
    return Flexible(
      child: ElevatedButton(
        onPressed: () {
          Get.offAndToNamed(
            AppRouterName.readDetail,
            arguments: ReadDetailArgument(
              id: argument.listChapter[argument.index + 1].id,
              listChapter: argument.listChapter,
              index: argument.index + 1,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8), // Không bo góc để thành hình chữ nhật
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: const Text(
          'Sau',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }

  Flexible _listchapter() {
    return Flexible(
      child: Container(
        width: 100,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            'Danh sách',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Flexible _priveousChapter() {
    return Flexible(
      child: ElevatedButton(
        onPressed: () {
          Get.offAndToNamed(
            AppRouterName.readDetail,
            arguments: ReadDetailArgument(
              id: argument
                  .listChapter[argument.index - 1 > 0 ? argument.index - 1 : 0]
                  .id,
              listChapter: argument.listChapter,
              index: argument.index - 1 > 0 ? argument.index - 1 : 0,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8), // Không bo góc để thành hình chữ nhật
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: const Text(
          'Trước',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
