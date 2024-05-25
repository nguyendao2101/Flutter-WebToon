import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/fearure/manga_detail/manga_detai_agruments.dart';
import 'package:untitled/fearure/search/search_controller.dart';
import 'package:untitled/router/router.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchMangaController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Manga',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getListRecommendedMangaStatus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  // Gọi hàm getListRecommentdedSeries mỗi khi giá trị của TextField thay đổi
                  controller.getListRecommentdedSeries(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  filled: true,
                  hintText: 'Enter Manga Name',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.getListRecommendedMangaStatus.value ==
                        GetListRecommendedMangaStatus.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.searchResults.length,
                        itemBuilder: (context, index) {
                          final item = controller.searchResults[index];
                          return ListTile(
                            title: Text(item.name),
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
