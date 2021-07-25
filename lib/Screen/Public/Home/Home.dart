import 'package:alsignon/Localization/LanguageLocalization.dart';
import 'package:alsignon/Router/RoutConstants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(onTap: (){
          Navigator.pushReplacementNamed(context, languageRoute);
      },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150,),
                  Center(child: Text("PRESS THE RED Area to change the Language ")),
                   SizedBox(height: 100,),
                  Expanded(
                                      child: Container(width: double.infinity, color: Colors.red,child: Text(LanguageLocalization.of(context)
                                                    .getTransilatedValue("Please enter a valid mobile number_login")),),
                  ),
                ],
              ),
      ),
    );
  }
}