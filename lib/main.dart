import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projet_cv/localization/localization_constants.dart';
import 'package:projet_cv/pages/centreinteret.page.dart';
import 'package:projet_cv/pages/competence.page.dart';
import 'package:projet_cv/pages/demo-localization.page.dart';
import 'package:projet_cv/pages/diplome.page.dart';
import 'package:projet_cv/pages/experienceacad.page.dart';
import 'package:projet_cv/pages/experienceprof.page.dart';
import 'package:projet_cv/pages/langue.page.dart';
import 'package:projet_cv/pages/map.page.dart';
import 'package:projet_cv/pages/profile.page.dart';
import 'package:projet_cv/pages/qualite.page.dart';
import 'package:projet_cv/pages/register.page.dart';
import 'package:projet_cv/pages/register2.page.dart';
import 'package:projet_cv/pages/register3.page.dart';
import 'package:projet_cv/pages/search.page.dart';
import 'package:projet_cv/pages/theme.page.dart';
import 'pages/home.page.dart';
import 'pages/login.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale locale){
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies(){
    getLocale().then((locale){
      setState(() {
        this._locale = locale;
      });
    } );
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final routes = {
      '/login': (context) => LoginPage(),
      '/home':(context) => HomePage(),
      '/register_1':(context) =>RegisterPage_1(),
      '/register_2':(context) =>RegisterPage_2(),
      '/register_3':(context) =>RegisterPage_3(),
      '/expProf': (context) => ExpProfPage(),
      '/expAcad':(context) =>ExpAcadPage(),
      '/diplome':(context) =>DiplomePage(),
      '/langue':(context) =>LanguePage(),
      '/competence': (context) => CompetencePage(),
      '/qualite':(context) =>QualitePage(),
      '/centreInter': (context) => CentreInteretPage(),
      '/search': (context) => SearchPage(),
      '/profile': (context) => ProfilePage(),
      '/setting': (context) => MyThemePage(),
      '/map': (context) => MapPage(),
    };
    
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(), 
      initial: AdaptiveThemeMode.light, 
      builder: (theme , darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        theme: theme,
        darkTheme: darkTheme,
        locale: _locale ?? Locale('en', 'US'),
        supportedLocales: [
          Locale('en','US'),
          Locale('fr','FR'),
          Locale('ar','SA'),
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales){
          for(var locale in supportedLocales){
            if(locale.languageCode == deviceLocale!.languageCode && locale.countryCode == deviceLocale.countryCode){
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        initialRoute: '/home',
      ),
    );
  }
}
