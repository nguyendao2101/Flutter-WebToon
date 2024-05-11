import 'package:get/get.dart';
import 'package:untitled/models/manga_detail/list_chapter_response.dart';
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

enum GetListChaptersStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

class MangaDetailController extends GetxController {
  final mangaDetailData = Rx<MangaDetailData?>(null);
  final getMangaDetailStatus = GetMangaDetailStatus.initial.obs;
  final getListChapterData = List<ChapterItem>.empty().obs;
  final getListChaptersStatus = GetListChaptersStatus.initial.obs;

  void getMangaDetailData(int? id) async {
    getMangaDetailStatus.value = GetMangaDetailStatus.isLoading;
    final getTopMangaResponse = await MangaDetailRepository().getTopManga(id);
    if (getTopMangaResponse is DataSuccess) {
      mangaDetailData.value = getTopMangaResponse.data?.mangaDetailData;
    }
    getMangaDetailStatus.value = GetMangaDetailStatus.loaded;
  }

  void getListChapters(int? id) async {
    getListChaptersStatus.value = GetListChaptersStatus.isLoading;
    final getListChaptersResponse =
        await MangaDetailRepository().getListChapters(id);
    if (getListChaptersResponse is DataSuccess) {
      getListChapterData.value = getListChaptersResponse.data?.data ?? [];
    }
    getListChaptersStatus.value = GetListChaptersStatus.loaded;
  }
}
