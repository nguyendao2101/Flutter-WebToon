import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/models/search/search_manga_response.dart';
import 'package:untitled/network/config/configs.dart';

part 'search_api_retrofit.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class SearchApiRetrofit {
  factory SearchApiRetrofit(Dio dio, {String baseUrl}) = _SearchApiRetrofit;

  @GET("/mangas/quick_search")
  Future<SearchMangaResponse> getListSearchManga(@Query('q') String name);
}
