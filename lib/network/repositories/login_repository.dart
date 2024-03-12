import 'package:untitled/models/login_reponse.dart';
import 'package:untitled/models/login_request.dart';
import 'package:untitled/network/config/date_state.dart';
import 'package:untitled/network/apis/login_api.dart';

class LoginRepository {
  Future<DataState<LoginResponseModel?>> login(LoginRequest request) async {
    final responseFromApi = await LoginApi().login(request);
    if (responseFromApi != null) {
      return DataSuccess(data: responseFromApi);
    } else {
      return DataFailed(data: responseFromApi);
    }
  }
}
