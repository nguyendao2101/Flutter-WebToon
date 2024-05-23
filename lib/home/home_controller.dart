import 'package:get/get.dart';
import 'package:untitled/models/get_top_manga_reponse.dart';
import 'package:untitled/models/home_models/get_list_top_manga_home_response.dart';
import 'package:untitled/models/home_models/home_list_model_respon.dart';
import 'package:untitled/network/config/date_state.dart';
import 'package:untitled/network/repositories/home/home_repository.dart';
import 'package:untitled/router/router.dart';

enum GetTopMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

enum GetListMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

enum GetListTopMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

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

class HomeController extends GetxController {
  final listMangaItem = <MangaItem?>[].obs;
  final getTopMangaStatus = GetTopMangaStatus.initial.obs;
  final getListMangaStatus = GetListMangaStatus.initial.obs;
  List<SpotlightMangas> listCaroselManga = <SpotlightMangas>[].obs;
  final getListTopMangaStatus = GetListTopMangaStatus.initial.obs;
  List<MangaItem> listTopCaroselManga = <MangaItem>[].obs;

  List<TopMangaItem> listTrendingManga = <TopMangaItem>[].obs;
  final getListTrendingMangaStatus = GetListTrendingMangaStatus.initial.obs;
  List<TopMangaItem> listTopseriManga = <TopMangaItem>[].obs;
  final getListTopSeriMangaStatus = GetListTopSeriMangaStatus.initial.obs;

  final currentPage = 0.obs;
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  Future<void> getListTrendingManga() async {
    getListTrendingMangaStatus.value = GetListTrendingMangaStatus.isLoading;
    final getListTrendingMangaResponse = await HomeRepository().getListTopManga(
      type: "week",
      page: "1",
      perPage: "9",
    );
    if (getListTrendingMangaResponse is DataSuccess) {
      listTrendingManga = getListTrendingMangaResponse.data?.data ?? [];
    }
    getListTrendingMangaStatus.value = GetListTrendingMangaStatus.loaded;
  }

  Future<void> getListSeriManga() async {
    getListTopSeriMangaStatus.value = GetListTopSeriMangaStatus.isLoading;
    final getListSeriMangaResponse = await HomeRepository().getListTopSeriManga(
      type: "week",
      page: "10",
      perPage: "12",
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

  Future<void> getTopMangaResponse() async {
    currentPage.value++;
    if (currentPage.value != 1) {
      getTopMangaStatus.value = GetTopMangaStatus.loadmore;
    } else {
      getTopMangaStatus.value = GetTopMangaStatus.isLoading;
    }

    final getTopMangaResponse = await HomeRepository().getTopManga(
      page: currentPage.value,
    );

    if (getTopMangaResponse is DataSuccess) {
      listMangaItem.addAll(getTopMangaResponse.data?.data ?? []);
      getTopMangaStatus.value = GetTopMangaStatus.loaded;
    }
    if (getTopMangaResponse is DataFailed) {
      getTopMangaStatus.value = GetTopMangaStatus.failed;
    }
  }

  Future<void> getListManga() async {
    getListMangaStatus.value = GetListMangaStatus.isLoading;
    final getTopMangaResponses = await HomeRepository().getListManga();
    if (getTopMangaResponses is DataSuccess) {
      listCaroselManga = getTopMangaResponses.data?.data?.spotlightMangas ?? [];
    }
    getListMangaStatus.value = GetListMangaStatus.loaded;
  }

  // void getListTopManga() async {
  //   getListTopMangaStatus.value = GetListTopMangaStatus.isLoading;
  //   final getListTopMangaResponse = await HomeRepository().getListManga();
  //   if (getListTopMangaResponse is DataSuccess) {
  //     listTopCaroselManga =
  //         getListTopMangaResponse.data?.data?. ?? [];
  //   }
  //   getListMangaStatus.value = GetListMangaStatus.loaded;
  // }

  goToRe() {
    return Get.toNamed(AppRouterName.register);
  }

  goToBook() {
    return Get.toNamed(AppRouterName.calendar);
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
}
