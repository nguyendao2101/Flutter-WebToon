import 'package:dio/dio.dart';
import 'package:untitled/models/manga_detail/manga_detail_response.dart';
import 'package:untitled/network/apis/detail_manga/detail_manga_retrofit.dart';
import 'package:untitled/network/config/date_state.dart';

class MangaDetailRepository {
  Future<DataState<GetDetailManga?>> getTopManga(int? id) async {
    final responseFromApi =
        await DetailMangaApiRetrofit(Dio()).getDetailManga(id.toString());
    if (responseFromApi.mangaDetailData != null) {
      return DataSuccess(data: responseFromApi);
    } else {
      return DataFailed(data: responseFromApi);
    }
  }
}
