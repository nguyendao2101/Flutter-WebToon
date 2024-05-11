import 'package:get/get.dart';
import 'package:untitled/models/chapter_detail/chapter_detail_response.dart';
import 'package:untitled/network/config/date_state.dart';
import 'package:untitled/network/repositories/manga_detail/manga_detail_repository.dart';

enum GetChapterDetailStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

class ReadDetailController extends GetxController {
  final chapterDetailData = Rx<ChapterDetailData?>(null);
  final getChapterDetailStatus = GetChapterDetailStatus.initial.obs;

  void getChapterDetailData(int? id) async {
    getChapterDetailStatus.value = GetChapterDetailStatus.isLoading;
    final getChapterDetailResponse =
        await MangaDetailRepository().getChaptersDetail(id);
    if (getChapterDetailResponse is DataSuccess) {
      chapterDetailData.value = getChapterDetailResponse.data?.data;
    }
    getChapterDetailStatus.value = GetChapterDetailStatus.loaded;
  }
}
