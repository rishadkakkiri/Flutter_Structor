
import 'package:alsignon/Localization/LanguageLocalization.dart';

import 'package:flutter/material.dart';

class NoInternet extends StatefulWidget {
  NoInternet({Key key}) : super(key: key);

  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return  Container(

        color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                            "lib/Assets/image/no_internet.gif",
                            width: 300,
                            height: 300,
                          ),
                          // SizedBox(height: 20,),

                Container(
        child: Center(child: Text(LanguageLocalization.of(context).getTransilatedValue("No Internet !!! _title"),style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.grey[700]),)),
      ),    
      SizedBox(height: 20,),
      
         Container(
        child: Center(child: Text(LanguageLocalization.of(context).getTransilatedValue("Your not connected to the internet.Make sure your wifi is on Airplain mod is off."),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),textAlign: TextAlign.center,)),
      ),
              ],
            ),
          ));
 
  }
}
