import 'package:flutter/material.dart';
import 'package:projet_cv/pages/demo-localization.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? getTranslated(BuildContext context,String key){
  return DemoLocalization.of(context).getTranslatedValue(key);
}

Future<List<dynamic>> getTranslatedData(BuildContext context,String key){
  return DemoLocalization.of(context).loadExperienceData(key);
}

Future<List<MapEntry<String, double>>> getlangData(BuildContext context, String key){
  return DemoLocalization.of(context).loadLanguageData(key);
}

Future<List<MapEntry<String, String>>> getcompetenceData(BuildContext context, String key){
  return DemoLocalization.of(context).loadCompetenceData(key);
}

const String ENGLISH = 'en';
const String FRANCAIS = 'fr';
const String ARABE = 'ar';

const String LANGAUGE_CODE = 'languageCode';

Future<Locale> setLocale(String languageCode) async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGAUGE_CODE, languageCode);

  return _locale(languageCode);
}

Locale _locale(String languageCode)
{
  Locale _temp;
  switch(languageCode){
      case ENGLISH : _temp = Locale(languageCode,"US");break;
      case FRANCAIS : _temp = Locale(languageCode,'FR');break;
      case ARABE : _temp = Locale(languageCode,'SA');break;
      default : _temp=Locale(ENGLISH,'US');
    }
  return _temp;
}

Future<Locale?> getLocale() async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGAUGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}