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
  List<TopMangaItem> listCaroselManga = <TopMangaItem>[].obs;
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

  void getListTrendingManga() async {
    getListTrendingMangaStatus.value = GetListTrendingMangaStatus.isLoading;
    final getListTrendingMangaResponse = await HomeRepository().getListTopManga(
      type: "week",
      page: "1",
      perPage: "10",
    );
    if (getListTrendingMangaResponse is DataSuccess) {
      listTrendingManga = getListTrendingMangaResponse.data?.data ?? [];
    }
    print(getListTrendingMangaResponse);
    for (var item in listTrendingManga) {
      print("item debug " + item.coverMobileUrl.toString());
    }
    getListTrendingMangaStatus.value = GetListTrendingMangaStatus.loaded;
  }

  void getTopMangaResponse() async {
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

  void getListManga() async {
    getListMangaStatus.value = GetListMangaStatus.isLoading;
    final getTopMangaResponse = await HomeRepository().getListManga();
    if (getTopMangaResponse is DataSuccess) {
      listCaroselManga = getTopMangaResponse.data?.data ?? [];
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
