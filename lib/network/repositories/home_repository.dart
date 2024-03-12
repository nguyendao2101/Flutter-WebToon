import 'package:untitled/models/get_top_manga_reponse.dart';
import 'package:untitled/network/apis/home_api.dart';
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
}
