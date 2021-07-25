import 'dart:convert';


import 'package:alsignon/CommonWidgets/LoadingSpinner.dart';
import 'package:alsignon/CommonWidgets/NoInternet.dart';
import 'package:alsignon/Constants/Constants.dart';
import 'package:alsignon/Localization/LocalizationConstants.dart';
import 'package:alsignon/Provider/PublicProvider.dart';
import 'package:alsignon/Router/RoutConstants.dart';
import 'package:alsignon/Services/ApiResponce.dart';
import 'package:alsignon/Services/Public/PublicService.dart';
import 'package:alsignon/Utilities/Tost.dart';
import 'package:alsignon/main.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CountryWidgets/CountryItem.dart';

class Country extends StatefulWidget {
  Country({Key key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  PublicService publicService = PublicService();
  TostService tostService = TostService();
  ApiResponce apiResponce;

  @override
  void initState() {
    // TODO: implement initState
 checkInternetStatus();
    makeGetCountryListApiCall();

    super.initState();
  }
  void checkInternetStatus() {
    var publicProvider = Provider.of<PublicProvider>(context, listen: false);

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
       publicProvider.changeNetworkStatus(true);
      } else {
       publicProvider.changeNetworkStatus(false);
      }
    });
  }
  makeGetCountryListApiCall() async {
        var connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  // I am connected to a mobile network.
} else if (connectivityResult == ConnectivityResult.wifi) {
  // I am connected to a wifi network.
}else{
     tostService.showValidationMessage("No internet connection !");
  return;
}
    var publicProvider = Provider.of<PublicProvider>(context, listen: false);
    publicProvider.setLoadingStatus(true);
    apiResponce = await publicService.getCountryListApi({});
    publicProvider.setLoadingStatus(false);
    if (apiResponce.statusCode == 200) {
      var publicProvider = Provider.of<PublicProvider>(context, listen: false);
      publicProvider.setCountryList(apiResponce.data["CountryList"]);

      if(publicProvider.countryList.length == 1)
      {
        setCountry(publicProvider.countryList[0]);
      }
    } else if (apiResponce.statusCode == 208) {
      tostService.showSucessMessage(apiResponce.errorMessage);
    }
  }

  void setLanguage() async {
    Locale _temp = await setLocale("en");

    MyApp.setLocale(context, _temp);
    var publicProvider = Provider.of<PublicProvider>(context, listen: false);
    publicProvider.setSelectedLanguage("en");
  }

  setCountry(item) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("country", json.encode(item));

    if (item["arabic_enable"] == 0) {
      setLanguage();
    }
      var publicProvider = Provider.of<PublicProvider>(context, listen: false);
publicProvider.setSelectedCountry(item);

    if (item["arabic_enable"] == 0) {
      Navigator.pushReplacementNamed(context, homeRoute);
    } else {
      Navigator.pushReplacementNamed(context, languageRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
     var publicProvider = Provider.of<PublicProvider>(context, listen: true);
    return Scaffold(
      body: publicProvider.networkAvailable == false ? NoInternet():   SafeArea(top: false,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 300,
                  color: Colors.transparent,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "COUNTRY",textAlign: TextAlign.left,
                        maxLines: 2,overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Schyler",
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 30),
                      ),
                      SizedBox(height: 5,),
                         Text(
                        "Select your country to countinue",textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Schyler",
                            color: Colors.white,
                            // fontWeight: FontWeight.w500,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<PublicProvider>(
                        builder: (context, data, child) {
                          if (data.isLoading) {
                            return LoadingSpinner();
                          } else {
                            return ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: data.countryList.length,
                                itemBuilder: (BuildContext context, i) {
                                  return CountryItem(
                                    countryItem: data.countryList[i],
                                    onPressed: () {
                                      setCountry(data.countryList[i]);
                                    },
                                  );
                                });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
