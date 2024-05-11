import 'package:get/get.dart';
import 'package:untitled/models/manga_detail/manga_detail_response.dart';
import 'package:untitled/network/config/date_state.dart';
import 'package:untitled/network/repositories/manga_detail/manga_detail_repository.dart';

enum GetMangaDetailStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

class MangaDetailController extends GetxController {
  final mangaDetailData = Rx<MangaDetailData?>(null);
  final getMangaDetailStatus = GetMangaDetailStatus.initial.obs;

  void getMangaDetailData(int? id) async {
    getMangaDetailStatus.value = GetMangaDetailStatus.isLoading;
    final getTopMangaResponse = await MangaDetailRepository().getTopManga(id);
    if (getTopMangaResponse is DataSuccess) {
      mangaDetailData.value = getTopMangaResponse.data?.mangaDetailData;
    }
    getMangaDetailStatus.value = GetMangaDetailStatus.loaded;
  }
}
