
import 'package:alsignon/Constants/Constants.dart';
import 'package:alsignon/Services/ApiRequest.dart';
import 'package:alsignon/Services/ApiResponce.dart';




class PublicService {
  ApiRequest apiRequest = ApiRequest();

  Future<ApiResponce> getCountryListApi(params) async {
    return apiRequest.apiRequest(AppUrls.urlCountryList, params);
  }

  

  
}
