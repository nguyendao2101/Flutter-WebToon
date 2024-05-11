import 'package:dio/dio.dart';
import 'package:untitled/models/get_top_manga_reponse.dart';
import 'package:untitled/models/home_models/home_list_model_repo.dart';
import 'package:untitled/models/home_models/get_list_top_manga_home_response.dart';
import 'package:untitled/network/apis/home_api.dart';
import 'package:untitled/network/apis/home/home_api_retrofit.dart';
import 'package:untitled/network/config/date_state.dart';

class HomeRepository {
  Future<DataState<GetTopMangaResponse?>> getTopManga({
    int page = 1,
    int perPage = 10,
  }) async {
    final responseFromApi =
        await HomeApi().getTopManga(perPage: perPage, page: page);
    if (responseFromApi != null) {
      return DataSuccess(data: responseFromApi);
    } else {
      return DataFailed(data: responseFromApi);
    }
  }

  Future<DataState<GetListMangaHomeResponse?>> getListManga() async {
    final responseFromApi = await HomeApiRetrofit(Dio()).getListManga();
    if (responseFromApi.data != null) {
      return DataSuccess(data: responseFromApi);
    } else {
      return DataFailed(data: responseFromApi);
    }
  }

  Future<DataState<GetListTopMangaHomeResponse?>> getListTopManga({
    String type = "week",
    String page = "1",
    String perPage = "10",
  }) async {
    final responseFromApi = await HomeApiListTopRetrofit(Dio()).getListTopManga(
      type: type,
      page: page,
      perPage: perPage,
    );

    if (responseFromApi.data.isNotEmpty) {
      return DataSuccess(data: responseFromApi);
    } else {
      return DataFailed(data: responseFromApi);
    }
  }
}
