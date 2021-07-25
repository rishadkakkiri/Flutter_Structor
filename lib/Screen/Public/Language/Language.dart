
import 'package:alsignon/CommonWidgets/NoInternet.dart';
import 'package:alsignon/Constants/Constants.dart';
import 'package:alsignon/Localization/LanguageLocalization.dart';
import 'package:alsignon/Localization/LocalizationConstants.dart';
import 'package:alsignon/Provider/PublicProvider.dart';
import 'package:alsignon/Router/RoutConstants.dart';
import 'package:alsignon/main.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Language extends StatefulWidget {
  Language({Key key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
// List languages = [{"name":"English","languageCode":"en"},{"name":"Arabic","languageCode":"ar"}];

  void setLanguage(String languageCode_pass) async {
    Locale _temp = await setLocale(languageCode_pass);

    MyApp.setLocale(context, _temp);
    var publicProvider = Provider.of<PublicProvider>(context, listen: false);
    publicProvider.setSelectedLanguage(languageCode_pass);
    Navigator.pushReplacementNamed(context, homeRoute);
  }
  @override
  void initState() { 
     checkInternetStatus();
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
  @override
  Widget build(BuildContext context) {
     var publicProvider = Provider.of<PublicProvider>(context, listen: true);
    return Scaffold(
      body: publicProvider.networkAvailable == false ? NoInternet():   SafeArea(
        top: false,
        child:  Container(
            color: Colors.orange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 300,

                
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LanguageLocalization.of(context).getTransilatedValue("LANGUAGE_page_title"),maxLines: 1,overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Schyler",
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 30),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        LanguageLocalization.of(context).getTransilatedValue("Select your language to countinue"),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Schyler",
                            color: Colors.white,
                            // fontWeight: FontWeight.w500,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                Expanded(
                                  child: Container(
                   
                    padding: EdgeInsets.all(50),
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
                            InkWell(onTap: (){setLanguage("en");},
                                                    child: Container(
                                                      width: 500,
                            height: 60,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5),boxShadow: [BoxShadow(color: Colors.grey[200],blurRadius: 7,offset: Offset(5,5))]),
                            child: 
                                Container(
                                  child: Text("ENGLISH"),
                                )
                             
                        ),
                         ),
                        SizedBox(height: 20,),
                         InkWell(onTap: (){setLanguage("ar");},
                                                    child: Container(
                                                      width: 500,
                            height: 60,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5),boxShadow: [BoxShadow(color: Colors.grey[200],blurRadius: 7,offset: Offset(5,5))]),
                            child: 
                                Container(
                                  child: Text("عربى"),
                                )
                             
                        ),
                         )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        
      ),
    );
  }
}
