import 'package:dio/dio.dart';
import 'package:untitled/models/search/search_manga_response.dart';
import 'package:untitled/network/apis/search/search_api_retrofit.dart';
import 'package:untitled/network/config/date_state.dart';

class SearchRepository {
  Future<DataState<SearchMangaResponse?>> getSearchManga(String? name) async {
    final responseFromApi =
        await SearchApiRetrofit(Dio()).getListSearchManga(name.toString());
    if (responseFromApi.data.isNotEmpty) {
      return DataSuccess(data: responseFromApi);
    } else {
      return DataFailed(data: responseFromApi);
    }
  }
}
