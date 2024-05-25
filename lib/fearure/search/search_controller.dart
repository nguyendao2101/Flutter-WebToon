import 'package:get/get.dart';
import 'package:untitled/models/home_models/get_list_top_manga_home_response.dart';
import 'package:untitled/network/config/date_state.dart';
import 'package:untitled/network/repositories/home/home_repository.dart';

enum GetListRecommendedMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

class SearchMangaController extends GetxController {
  List<TopMangaItem> listRecommendedManga = <TopMangaItem>[].obs;
  final getListRecommendedMangaStatus =
      GetListRecommendedMangaStatus.initial.obs;

  // Danh sách truyện tìm kiếm
  List<TopMangaItem> searchResults = <TopMangaItem>[].obs;

  Future<void> getListRecommentdedSeries(String keyword) async {
    getListRecommendedMangaStatus.value =
        GetListRecommendedMangaStatus.isLoading;

    listRecommendedManga.clear();
    for (int page = 1; page <= 10; page++) {
      final getListTrendingMangaResponse =
          await HomeRepository().getListTopManga(
        type: "week",
        page: page.toString(),
        perPage: "24",
      );

      if (getListTrendingMangaResponse is DataSuccess) {
        listRecommendedManga
            .addAll(getListTrendingMangaResponse.data?.data ?? []);
      }
    }

    // Lọc danh sách truyện dựa trên từ khóa
    if (keyword.isEmpty) {
      searchResults.assignAll(listRecommendedManga);
    } else {
      searchResults.clear();
      for (var manga in listRecommendedManga) {
        if (manga.name.toLowerCase().contains(keyword.toLowerCase())) {
          searchResults.add(manga);
        }
      }
    }

    getListRecommendedMangaStatus.value = GetListRecommendedMangaStatus.loaded;
  }
}
