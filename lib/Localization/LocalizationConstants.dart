import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String ENGLISH = 'en';
const String ARABIC = 'ar';

const String LANGAUGE_CODE = 'languageCode';
Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGAUGE_CODE, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode);
      break;
    case ARABIC:
      _temp = Locale(languageCode);
      break;
    default:
      _temp = Locale(ENGLISH);
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGAUGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}
