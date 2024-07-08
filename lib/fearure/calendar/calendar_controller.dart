import 'package:get/get.dart';
import 'package:untitled/fearure/home/home_gruments.dart';
import 'package:untitled/models/home_models/get_list_top_manga_home_response.dart';
import 'package:untitled/network/config/date_state.dart';
import 'package:untitled/network/repositories/home/home_repository.dart';
import 'package:untitled/router/router.dart';

enum GetListUpdateTodayMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

enum GetListUpdateNewMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

class CalendarController extends GetxController {
  List<TopMangaItem> listUpdateTodayManga = <TopMangaItem>[].obs;
  final getListUpdateTodayMangaStatus =
      GetListUpdateTodayMangaStatus.initial.obs;

  List<TopMangaItem> listUpdateNewManga = <TopMangaItem>[].obs;
  final getListUpdateNewMangaStatus = GetListUpdateNewMangaStatus.initial.obs;

  Future<void> getListUpdateTodayManga() async {
    getListUpdateTodayMangaStatus.value =
        GetListUpdateTodayMangaStatus.isLoading;
    final getListTrendingMangaResponse = await HomeRepository().getListTopManga(
      type: "week",
      page: "2",
      perPage: "6",
    );
    if (getListTrendingMangaResponse is DataSuccess) {
      listUpdateTodayManga = getListTrendingMangaResponse.data?.data ?? [];
    }
    getListUpdateTodayMangaStatus.value = GetListUpdateTodayMangaStatus.loaded;
  }

  Future<void> getListUpdateNewManga() async {
    getListUpdateNewMangaStatus.value = GetListUpdateNewMangaStatus.isLoading;
    final getListSeriMangaResponse = await HomeRepository().getListTopSeriManga(
      type: "week",
      page: "3",
      perPage: "15",
    );
    if (getListSeriMangaResponse is DataSuccess) {
      listUpdateNewManga = getListSeriMangaResponse.data?.data ?? [];
    }
    // print(getListSeriMangaResponse);
    // for (var item in listTrendingManga) {
    //   print("item debuggg " + item.coverMobileUrl.toString());
    // }
    getListUpdateNewMangaStatus.value = GetListUpdateNewMangaStatus.loaded;
  }

  goToHightlight() {
    return Get.toNamed(AppRouterName.sport_light);
  }

  goToSetting() {
    return Get.toNamed(AppRouterName.setting);
  }

  goToHome() {
    return Get.toNamed(AppRouterName.home,
        arguments: HomeAgrument(username: '', password: ''));
  }
}
