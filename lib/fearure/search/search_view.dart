import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/manga_detail/manga_detai_agruments.dart';
import 'package:untitled/fearure/search/search_controller.dart';
import 'package:untitled/router/router.dart';
import 'package:untitled/themes/theme_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;
    final controller = Get.find<SearchMangaController>();

    return Scaffold(
      backgroundColor: themeData.value.color.lightBackground,
      appBar: AppBar(
        backgroundColor: themeData.value.color.lightBackground,
        title: Text(
          'Search Manga',
          style: themeData.value.text.h20,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getListSearchMangaStatus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 64,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: const Color(0xff292E4B),
                    borderRadius: BorderRadius.circular(19)),
                child: TextField(
                  onChanged: (value) {
                    // Gọi hàm getListRecommentdedSeries mỗi khi giá trị của TextField thay đổi
                    controller.getListRecommentdedSeries(value);
                  },
                  decoration: const InputDecoration(
                    errorBorder: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    filled: true,
                    hintText: 'Search Manga Name',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.getListSearchMangaStatus.value ==
                        GetListSearchMangaStatus.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.searchResults.length,
                        itemBuilder: (context, index) {
                          final item = controller.searchResults[index];
                          return ListTile(
                            title: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    item.coverMobileUrl,
                                    height: 100,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: themeData.value.text.h18,
                                      ),
                                      Text(
                                        item.authorName,
                                        style: themeData.value.text.h12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              // Thực hiện hành động khi một mục được chọn
                              Get.toNamed(AppRouterName.mangaDetail,
                                  arguments: MangaDetailAgruments(id: item.id));
                            },
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
