

import 'package:alsignon/Constants/Constants.dart';
import 'package:flutter/foundation.dart';

class PublicProvider extends ChangeNotifier {
bool isLoading = false;

bool canCloseTheUpdateScreen = true;
bool canShowUpdateScreen = false;
String appUpdateMessage = "";
bool networkAvailable = true;
List countryList = [];
String fcmToken = "";
  

String selectedLanguage ="en";


   var selectedCountry = {};



  setAppStatus(passData) {


    
    canCloseTheUpdateScreen = passData["canCloseTheUpdateScreen"];
    canShowUpdateScreen = passData["canShowUpdateScreen"];
    appUpdateMessage = selectedLanguage == "en" ? passData["appUpdateMessage"]:passData["appUpdateMessage_ar"];
  

    notifyListeners();
  }
   


  setFcmToken(fcmToken_pass) {
    fcmToken = fcmToken_pass;
    notifyListeners();
  }



   setLoadingStatus(passValue) {
    isLoading = passValue;
    notifyListeners();
  }


  closeAppUpdateSettings() {
    
    canShowUpdateScreen = false;
  
    notifyListeners();
  }


changeNetworkStatus(value) {
    
    networkAvailable = value;
  
    notifyListeners();
}

    setSelectedCountry(selectedCountryPass) {
    selectedCountry = selectedCountryPass;
    notifyListeners();
  }

    setSelectedLanguage(selectedLanguagePass) {
    publicSelectedLanguage=selectedLanguagePass;
    selectedLanguage = selectedLanguagePass;
    notifyListeners();
  }

    void setCountryList(countryListPass) {
    countryList = countryListPass;
    notifyListeners();
  }
}
