import 'package:get/get.dart';
import 'package:untitled/fearure/home/home_gruments.dart';
import 'package:untitled/models/home_models/get_list_top_manga_home_response.dart';
import 'package:untitled/network/config/date_state.dart';
import 'package:untitled/network/repositories/home/home_repository.dart';
import 'package:untitled/router/router.dart';

enum GetListRecommendedMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

enum GetListWeekyHotMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

class SportLightController extends GetxController {
  List<TopMangaItem> listRecommendedManga = <TopMangaItem>[].obs;
  final getListRecommendedMangaStatus =
      GetListRecommendedMangaStatus.initial.obs;

  List<TopMangaItem> listWeekyHotManga = <TopMangaItem>[].obs;
  final getListWeekyHotMangaStatus = GetListWeekyHotMangaStatus.initial.obs;

  Future<void> getListRecommentdedSeries() async {
    getListRecommendedMangaStatus.value =
        GetListRecommendedMangaStatus.isLoading;
    final getListTrendingMangaResponse = await HomeRepository().getListTopManga(
      type: "week",
      page: "4",
      perPage: "15",
    );
    if (getListTrendingMangaResponse is DataSuccess) {
      listRecommendedManga = getListTrendingMangaResponse.data?.data ?? [];
    }
    getListRecommendedMangaStatus.value = GetListRecommendedMangaStatus.loaded;
  }

  Future<void> getListWeekyHot() async {
    getListWeekyHotMangaStatus.value = GetListWeekyHotMangaStatus.isLoading;
    final getListSeriMangaResponse = await HomeRepository().getListTopSeriManga(
      type: "week",
      page: "5",
      perPage: "15",
    );
    if (getListSeriMangaResponse is DataSuccess) {
      listWeekyHotManga = getListSeriMangaResponse.data?.data ?? [];
    }
    // print(getListSeriMangaResponse);
    // for (var item in listTrendingManga) {
    //   print("item debuggg " + item.coverMobileUrl.toString());
    // }
    getListWeekyHotMangaStatus.value = GetListWeekyHotMangaStatus.loaded;
  }

  goToBook() {
    return Get.toNamed(AppRouterName.calendar);
  }

  goToSetting() {
    return Get.toNamed(AppRouterName.setting);
  }

  goToHome() {
    return Get.toNamed(AppRouterName.home,
        arguments: HomeAgrument(username: '', password: ''));
  }
}
