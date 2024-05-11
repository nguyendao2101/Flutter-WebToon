import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/models/home_models/home_list_model_repo.dart';
import 'package:untitled/models/home_models/get_list_top_manga_home_response.dart';
import 'package:untitled/network/config/configs.dart';

part 'home_api_retrofit.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class HomeApiRetrofit {
  factory HomeApiRetrofit(Dio dio, {String baseUrl}) = _HomeApiRetrofit;
  @GET("/home_a")
  Future<GetListMangaHomeResponse> getListManga();
}

@RestApi(baseUrl: Constants.BASE_URL)
abstract class HomeApiListTopRetrofit {
  factory HomeApiListTopRetrofit(Dio dio, {String baseUrl}) =
      _HomeApiListTopRetrofit;
  @GET("/mangas/top")
  Future<GetListTopMangaHomeResponse> getListTopManga({
    @Query('duration') String type = "week",
    @Query('page') String page = "1",
    @Query('per_page') String perPage = "10",
  });
}
