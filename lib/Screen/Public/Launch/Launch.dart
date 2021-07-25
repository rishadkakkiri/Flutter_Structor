import 'dart:convert';


import 'package:alsignon/Localization/LanguageLocalization.dart';
import 'package:alsignon/Provider/PublicProvider.dart';
import 'package:alsignon/Router/RoutConstants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Launch extends StatefulWidget {
  Launch({Key key}) : super(key: key);

  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
    // bool networkresult = true;
  // bool notificationRouteAvalabe=false;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    
   
 

    Future.delayed(const Duration(seconds: 1), () {
      setRoutes();
    });
  }



//start
  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }




  Future<void> setRoutes() async {
    final SharedPreferences prefs = await _prefs;
    var publicProvider = Provider.of<PublicProvider>(context, listen: false);
// var a= json.decode(prefs.getString("country"));

    String languageCode = prefs.getString("languageCode") ?? "en";

    publicProvider.setSelectedLanguage(languageCode);

    var selectedCountry = prefs.getString("country");
    if (selectedCountry == null) {
      Navigator.pushReplacementNamed(context, onBoardingRoute);
    } else {
      print(json.decode(selectedCountry));
      var selectedCountryLocal = json.decode(selectedCountry);
      print("=======================");
      publicProvider.setSelectedCountry(selectedCountryLocal);

// Navigator.pushReplacementNamed(context, chatRoute);


// if(notificationRouteAvalabe==true)
// {
      Navigator.pushReplacementNamed(context, homeRoute);
          // }
          // else
  //         {
  //  Navigator.pushReplacementNamed(context, dashboardRoute,
  //         arguments: {"passIndex": 1});
  //         this.setState(() {notificationRouteAvalabe=false;});
  //         }
    }
  }

  @override
  Widget build(BuildContext context) {
    // var publicProvider = Provider.of<PublicProvider>(context);
    return Scaffold(
      body: Center(
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                            "lib/Assets/image/mainlogo.png",
                            width: 100,
                            height: 100,
                          ),  SizedBox(
                        height: 30,
                      ),
                      Text(
                        LanguageLocalization.of(context)
                                        .getTransilatedValue("AllInOne"), maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 35),
                      )
            ],
          )),
    );
  }

}
