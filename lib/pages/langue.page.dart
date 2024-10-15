import 'package:flutter/material.dart';
import 'package:projet_cv/components/my_drawer.dart';
import 'package:projet_cv/localization/localization_constants.dart';

class LanguePage extends StatefulWidget{
  const LanguePage ({super.key});

  @override
  State<LanguePage> createState() => _LanguePageState();
}

class _LanguePageState extends State<LanguePage> {
  List<MapEntry<String, double>>? langues;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadLanguageData();
  }
  Future<void> _loadLanguageData() async {
    List<MapEntry<String, double>> data = await getlangData(context,'langues');
    setState(() {
      langues = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'lang')!),
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


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              if (langues != null)
                for (var entry in langues!)
                  _buildLang(entry.key, entry.value),
                  
            ],

          ),
        ),
          
        
      ),

    );
  }

Padding _buildLang(String lang, double level) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        
        children: [
          SizedBox(height: 20,), // zedha 
          Expanded(
            flex: 1,
            child: Text(lang,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
              textAlign: TextAlign.left,),
          ),
          
          SizedBox(width: 10,),
          Expanded(
            flex: 4,
            child: LinearProgressIndicator(value: level,color: Colors.blueGrey,),
          ),
      
          
        ],
      ),
    );
  }
}