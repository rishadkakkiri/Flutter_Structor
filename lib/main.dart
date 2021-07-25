// https://www.youtube.com/watch?v=oWHfbJyTyBc
import 'package:alsignon/Localization/LocalizationConstants.dart';

import 'package:alsignon/Provider/PublicProvider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import './Router/RoutConstants.dart';
import './Router/Router.dart';
import 'Localization/LanguageLocalization.dart';



// void main() => runApp(MyApp());


void main() async {
   WidgetsFlutterBinding.ensureInitialized();

   runApp(MyApp());
}
// void main() { 
  

//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:Colors.transparent,
//   statusBarBrightness: Brightness.light));

// // SystemChrome.setEnabledSystemUIOverlays([]);
  
//   return runApp(MyApp());


// }

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;



  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return PublicProvider();
            },
          ),

 


          
        ],
        child: MaterialApp(
            localizationsDelegates: [
              LanguageLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en'),
              const Locale('ar'),
            ],
            locale: _locale,
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (locale.languageCode == deviceLocale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            debugShowCheckedModeBanner: false,
            initialRoute: launchRoute,
            onGenerateRoute: Routes.AllRoutes));
  }
}
