import 'package:get/get.dart';
import 'package:untitled/models/search/search_manga_response.dart';
import 'package:untitled/network/config/date_state.dart';
import 'package:untitled/network/repositories/search/search_repository.dart';

enum GetListSearchMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

class SearchMangaController extends GetxController {
  List<Datum> listSearchManga = <Datum>[].obs;
  final getListSearchMangaStatus = GetListSearchMangaStatus.initial.obs;
  List<Datum> searchResults = <Datum>[].obs;
  final SearchRepository _searchRepository = SearchRepository();

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    getListSearchMangaStatus.value = GetListSearchMangaStatus.isLoading;

    // Giả sử dữ liệu được tải từ repository

    getListSearchMangaStatus.value = GetListSearchMangaStatus.loaded;
    searchResults.assignAll(listSearchManga);
  }

  Future<void> getListRecommentdedSeries(String keyword) async {
    getListSearchMangaStatus.value = GetListSearchMangaStatus.isLoading;

    final response = await _searchRepository.getSearchManga(keyword);

    if (response is DataSuccess) {
      searchResults.assignAll(response.data?.data ?? []);
    } else {
      searchResults.clear();
    }

    getListSearchMangaStatus.value = GetListSearchMangaStatus.loaded;
  }
}
