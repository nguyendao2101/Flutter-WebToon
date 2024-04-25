import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/models/home_models/home_list_model_repo.dart';
import 'package:untitled/network/config/configs.dart';

part 'home_api_retrofit.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class HomeApiRetrofit {
  factory HomeApiRetrofit(Dio dio, {String baseUrl}) = _HomeApiRetrofit;
  @GET("/home_a")
  Future<GetListMangaHomeResponse> getListManga();
}
