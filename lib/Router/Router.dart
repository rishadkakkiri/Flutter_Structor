
import 'package:alsignon/Screen/Public/Country/Country.dart';
import 'package:alsignon/Screen/Public/Home/Home.dart';
import 'package:alsignon/Screen/Public/Language/Language.dart';
import 'package:alsignon/Screen/Public/Launch/Launch.dart';

import 'package:alsignon/Screen/Public/OnBoarding/OnBoarding.dart';

import 'package:flutter/material.dart';

import '../Router/RoutConstants.dart';

class Routes {
  static Route<dynamic> AllRoutes(RouteSettings settings) {
    switch (settings.name) {

         case onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoarding());
      case countryRoute:
        return MaterialPageRoute(builder: (_) => Country());
      case languageRoute:
        return MaterialPageRoute(builder: (_) => Language());
      case launchRoute:
        return MaterialPageRoute(builder: (_) => Launch());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());

//PASSING DATA ,passData will be object
    // case orderDetailsRoute:
    //     return MaterialPageRoute(builder: (_) => OrderDetails(passData: settings.arguments));


        

    }
  
    
    
   
  }
}
