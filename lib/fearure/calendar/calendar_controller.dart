import 'package:get/get.dart';
import 'package:untitled/home/home_gruments.dart';
import 'package:untitled/models/home_models/get_list_top_manga_home_response.dart';
import 'package:untitled/network/config/date_state.dart';
import 'package:untitled/network/repositories/home/home_repository.dart';
import 'package:untitled/router/router.dart';

enum GetListTrendingMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

enum GetListTopSeriMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

class CalendarController extends GetxController {
  List<TopMangaItem> listTrendingManga = <TopMangaItem>[].obs;
  final getListTrendingMangaStatus = GetListTrendingMangaStatus.initial.obs;

  List<TopMangaItem> listTopseriManga = <TopMangaItem>[].obs;
  final getListTopSeriMangaStatus = GetListTopSeriMangaStatus.initial.obs;

  Future<void> getListUpdateTodayManga() async {
    getListTrendingMangaStatus.value = GetListTrendingMangaStatus.isLoading;
    final getListTrendingMangaResponse = await HomeRepository().getListTopManga(
      type: "week",
      page: "2",
      perPage: "6",
    );
    if (getListTrendingMangaResponse is DataSuccess) {
      listTrendingManga = getListTrendingMangaResponse.data?.data ?? [];
    }
    getListTrendingMangaStatus.value = GetListTrendingMangaStatus.loaded;
  }

  Future<void> getListUpdateNewManga() async {
    getListTopSeriMangaStatus.value = GetListTopSeriMangaStatus.isLoading;
    final getListSeriMangaResponse = await HomeRepository().getListTopSeriManga(
      type: "week",
      page: "3",
      perPage: "15",
    );
    if (getListSeriMangaResponse is DataSuccess) {
      listTopseriManga = getListSeriMangaResponse.data?.data ?? [];
    }
    // print(getListSeriMangaResponse);
    // for (var item in listTrendingManga) {
    //   print("item debuggg " + item.coverMobileUrl.toString());
    // }
    getListTopSeriMangaStatus.value = GetListTopSeriMangaStatus.loaded;
  }

  goToHightlight() {
    return Get.toNamed(AppRouterName.hightlight);
  }

  goToMy() {
    return Get.toNamed(AppRouterName.my);
  }

  goToSetting() {
    return Get.toNamed(AppRouterName.setting);
  }

  goToHome() {
    return Get.toNamed(AppRouterName.home,
        arguments: HomeAgrument(username: '', password: ''));
  }
}
