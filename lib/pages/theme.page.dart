import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:projet_cv/classes/language.dart';
import 'package:projet_cv/components/my_drawer.dart';
import 'package:projet_cv/localization/localization_constants.dart';
import 'package:projet_cv/main.dart';
//import 'package:sliding_switch/sliding_switch.dart';

class MyThemePage extends StatefulWidget {

  @override
  _MyThemePageState createState() => _MyThemePageState();

}

class _MyThemePageState extends State<MyThemePage> {
  bool darkmode = false;
  dynamic savedThemeMode;
  Language? selectedLanguage = Language(1, "🇺🇸", "English", "en");
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if(savedThemeMode.toString() == 'AdaptiveThemeMode.dark'){
      print('thème sombre');
      setState(() {
        darkmode = true;
      });
    }
    else {
      print('thème clair');
      setState(() {
        darkmode = false;
      });
    }
  }

  void _changeLanguage(Language language) async{
    print(language.languageCode);
    //Locale _temp = await setLocale(language.languageCode);
    Locale _temp;
    switch(language.languageCode){
      case 'en' : _temp = Locale(language.languageCode,"US");break;
      case 'fr' : _temp = Locale(language.languageCode,'FR');break;
      case 'ar' : _temp = Locale(language.languageCode,'SA');break;
      default : _temp=Locale('en','US');
    }
    MyApp.setLocale(context,_temp);

    setState(() {
      selectedLanguage = language;
    });
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'setti')!),
        backgroundColor: Colors.blueGrey,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:5.0),
            child: IconButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('lib/images/yessin.jpg'),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/setting'); 
              },
            ),
          ),
        ],
        
      ),
      drawer: MyDrawer(),

      body:Padding(
  padding: EdgeInsets.all(20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Changer de thème
      Text(
        getTranslated(context, 'themetit')!,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            getTranslated(context, 'themesous')!,
            style: TextStyle(fontSize: 18),
          ),
          Switch(
            activeColor: Colors.cyanAccent,
            value: darkmode,
            onChanged: (bool value) {
              if (value == true) {
                AdaptiveTheme.of(context).setDark();
              } else {
                AdaptiveTheme.of(context).setLight();
              }
              setState(() {
                darkmode = value;
              });
            },
          ),
        ],
      ),
      SizedBox(height: 20),
      Divider(height: 6, color: Colors.blueGrey),
      SizedBox(height: 20),
      // Changer de Langue
      Text(
        getTranslated(context, 'langtit')!,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            getTranslated(context, 'lengsous')!,
            style: TextStyle(fontSize: 18),
          ),
          Text(selectedLanguage != null ? selectedLanguage!.name : ''),
          DropdownButton(
            onChanged: (Language? language) {
              _changeLanguage(language!);
            },
            icon: Icon(
              Icons.arrow_drop_down,
            ),
            items: Language.languageList().map<DropdownMenuItem<Language>>((lang) =>DropdownMenuItem(
              value: lang,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(lang.flag),
                  Text(lang.name),
                ],
              ),
            )).toList(),
          ),
        ],
      ),
    ],
  ),
),


      

    );
    }
}