import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:untitled/models/get_top_manga_reponse.dart';

// Home Api
class HomeApi {
  Future<GetTopMangaResponse?> getTopManga({
    int page = 1,
    int perPage = 10,
  }) async {
    var dio = Dio();

    try {
      var response = await dio.request(
        'https://cuutruyent9sv7.xyz/api/v2/mangas/top?duration=week&page=$page&per_page=$perPage',
        options: Options(
          method: 'GET',
        ),
      );
      if (response.statusCode == 200) {
        final getTopMangaResponse =
            GetTopMangaResponse.fromJson(json.encode(response.data));
        return getTopMangaResponse;
      } else {
        return Future.value(null);
      }
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }
}
