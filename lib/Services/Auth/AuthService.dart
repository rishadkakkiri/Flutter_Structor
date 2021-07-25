
import 'package:alsignon/Constants/Constants.dart';
import 'package:alsignon/Services/ApiRequest.dart';
import 'package:alsignon/Services/ApiResponce.dart';

class AuthService {
  ApiRequest apiRequest = ApiRequest();

  Future<ApiResponce> loginApi(params) async {
    return apiRequest.apiRequest(AppUrls.urlCountryList, params);
  }

  Future<ApiResponce> otpVerifyApi(params) async {
    return apiRequest.apiRequest(AppUrls.urlCountryList, params);
  }
}
