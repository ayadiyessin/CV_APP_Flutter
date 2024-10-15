import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalization {
  DemoLocalization(this.locale);
  
  final Locale locale;
  
  static DemoLocalization of(BuildContext context){
    return Localizations.of<DemoLocalization>(context, DemoLocalization)!;
  }

  Map<String,String>? _localizedValues;

  Future load() async {
    String jsonStringValues = await rootBundle.loadString('lib/lang/${locale.languageCode}.json');

    Map<String,dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  Future<List<dynamic>> loadExperienceData(String key) async {
    // Charger le contenu du fichier JSON
    String jsonString =
        await rootBundle.loadString('lib/lang/${locale.languageCode}.json');

    // Convertir le JSON en une liste dynamique
    Map<String, dynamic> data = json.decode(jsonString);
    return data[key];
  }

  Future<List<MapEntry<String, double>>> loadLanguageData(String key) async {
  // Charger le contenu du fichier JSON
  String jsonString =
      await rootBundle.loadString('lib/lang/${locale.languageCode}.json');

  // Convertir le JSON en une carte dynamique
  Map<String, dynamic> data = json.decode(jsonString);

  List<dynamic>? languesList = data[key];

  // Convertir la liste en une liste de MapEntry<String, double>
  List<MapEntry<String, double>> languesEntries = [];
  if (languesList != null) {
    for (var item in languesList) {
      if (item is Map<String, dynamic> && item.isNotEmpty) {
        final entry = item.entries.first;
        languesEntries.add(MapEntry<String, double>(entry.key, entry.value.toDouble()));
      }
    }
  }

  return languesEntries;
}


Future<List<MapEntry<String, String>>> loadCompetenceData(String key) async {
  // Charger le contenu du fichier JSON
  String jsonString =
      await rootBundle.loadString('lib/lang/${locale.languageCode}.json');

  // Convertir le JSON en une carte dynamique
  Map<String, dynamic> data = json.decode(jsonString);

  List<dynamic>? competenceList = data[key];

  // Convertir la liste en une liste de MapEntry<String, String>
  List<MapEntry<String, String>> competenceEntries = [];
  if (competenceList != null) {
    for (var item in competenceList) {
      if (item is Map<String, dynamic> && item.isNotEmpty) {
        item.forEach((key, value) {
          if (value is List) {
            final values = value.join(", ");
            competenceEntries.add(MapEntry<String, String>(key, values));
          } else if (value is String) {
            competenceEntries.add(MapEntry<String, String>(key, value));
          }
        });
      }
    }
  }

  return competenceEntries;
}


  String? getTranslatedValue (String key){
    return _localizedValues![key];
  }
 
 static const LocalizationsDelegate<DemoLocalization> delegate = _DemoLocalizationDelegate();
}

class _DemoLocalizationDelegate extends LocalizationsDelegate<DemoLocalization>{
  const _DemoLocalizationDelegate();
  @override
  bool isSupported(Locale locale){

    return ['en','fr','ar'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalization> load(Locale locale) async{

    DemoLocalization localization = new DemoLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_DemoLocalizationDelegate old) =>true;
}