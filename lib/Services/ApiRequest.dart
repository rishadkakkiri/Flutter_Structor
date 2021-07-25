
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:alsignon/Constants/Constants.dart';
import 'package:alsignon/Services/ApiResponce.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;
import 'package:package_info/package_info.dart';

class ApiRequest {
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<ApiResponce> apiRequest(url, params) async {

       final SharedPreferences prefs = await _prefs;

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

String appName = packageInfo.appName;
String packageName = packageInfo.packageName;
String version = packageInfo.version;
String buildNumber = packageInfo.buildNumber;

Map newParams = Map();
newParams.addAll(params);

newParams["version"]=version;
newParams["buildNumber"]=buildNumber;
    newParams["platform"]= Platform.isIOS ? "0" : "1";


  var selectedCountry = prefs.getString("country");
    if (selectedCountry != null) {
      var country=json.decode(selectedCountry);
      newParams["country_id"]= country["_id"];
    }

print(HOSTNAME+url);
    print(newParams);
    var body = json.encode(newParams);
    var _userToken = prefs.getString("user_token") ?? "";

    var header = {'Content-type': 'application/json',
     'Authorization': 'Bearer ' + _userToken
    };
    // print(header);
    // print(HOSTNAME+url);
    // print(body);
print(header);
    return await http
        .post(HOSTNAME+url, body: body, headers: header)
        .then((response) {
          print(response);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return ApiResponce(data: jsonResponse);
      } else if (response.statusCode == 208) {
        
        var jsonResponse = convert.jsonDecode(response.body);
        return ApiResponce(
            error: true,
            errorMessage: publicSelectedLanguage == "en" ?  jsonResponse['message']:jsonResponse['message_ar'],
            statusCode: response.statusCode);
      } else {
        var jsonResponse = convert.jsonDecode(response.body);
        return ApiResponce(
            error: true,
            errorMessage: jsonResponse['message'],
            statusCode: response.statusCode);
      }
    }).catchError((err) {
      print(err);
      return ApiResponce(error: true, statusCode: 500);
    });
  }
}
