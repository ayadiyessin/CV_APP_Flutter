import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:projet_cv/components/my_drawer.dart';
import 'package:projet_cv/localization/localization_constants.dart';
import 'package:projet_cv/pages/homecontent.page.dart';
import 'package:projet_cv/pages/profile.page.dart';
import 'package:projet_cv/pages/search.page.dart';

class HomePage extends StatefulWidget{
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    HomeContentPage(), // Remplacez HomeContent par le contenu de votre première page
    SearchPage(), // Remplacez SearchPage par le contenu de votre deuxième page
    ProfilePage(), // Remplacez ProfilePage par le contenu de votre troisième page
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'home')!),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
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


     body: _pages[_pageIndex],


      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blueGrey,
        color: Colors.blueGrey,
        animationDuration: const Duration(milliseconds: 200),
        items: const <Widget> [
          Icon(Icons.home, size: 26, color: Colors.white,),
          Icon(Icons.search, size: 26, color: Colors.white,),
          Icon(Icons.person, size: 26, color: Colors.white,),
        ],
        onTap: (index){
          setState(() {
              _pageIndex = index;
            });
          },
          index: _pageIndex,
      ),
    );
  }
}