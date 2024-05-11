import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled/fearure/read_detail/read_detail_argument.dart';
import 'package:untitled/fearure/read_detail/read_detail_controller.dart';
import 'package:untitled/router/router.dart';

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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text('Tên truyện'),
              floating: true,
              snap: true,
              elevation: 0,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.offAndToNamed(
                        AppRouterName.readDetail,
                        arguments: ReadDetailArgument(
                          id: argument
                              .listChapter[argument.index - 1 > 0
                                  ? argument.index - 1
                                  : 0]
                              .id,
                          listChapter: argument.listChapter,
                          index:
                              argument.index - 1 > 0 ? argument.index - 1 : 0,
                        ),
                      );
                    },
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
                          'Chương trước',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Danh sách',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAndToNamed(
                        AppRouterName.readDetail,
                        arguments: ReadDetailArgument(
                          id: argument.listChapter[argument.index + 1].id,
                          listChapter: argument.listChapter,
                          index: argument.index + 1,
                        ),
                      );
                    },
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
                          'Chương sau',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
