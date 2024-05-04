import 'package:get/get.dart';
import 'package:untitled/models/get_top_manga_reponse.dart';
import 'package:untitled/models/home_models/home_list_model_repo.dart';
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

class HomeController extends GetxController {
  final listMangaItem = <MangaItem?>[].obs;
  final getTopMangaStatus = GetTopMangaStatus.initial.obs;
  final getListMangaStatus = GetListMangaStatus.initial.obs;
  List<SpotlightMangas> listCaroselManga = <SpotlightMangas>[].obs;
  final getListTopMangaStatus = GetListTopMangaStatus.initial.obs;
  List<MangaItem> listTopCaroselManga = <MangaItem>[].obs;

  final currentPage = 0.obs;
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  // void getListMusic() async {
  //   final getTopMusicResponse = await HomeRepository().getMusicChart();
  //   if (getTopMusicResponse is DataSuccess) {
  //     listCarouseMusic = getTopMusicResponse.data?.tracks?.data ?? [];
  //   }
  //   getListMusicChart.value =
  // }

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
      listCaroselManga = getTopMangaResponse.data?.data?.spotlightMangas ?? [];
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
