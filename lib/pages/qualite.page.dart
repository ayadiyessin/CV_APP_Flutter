import 'package:flutter/material.dart';
import 'package:projet_cv/components/my_drawer.dart';
import 'package:projet_cv/localization/localization_constants.dart';

class QualitePage extends StatefulWidget{
  const QualitePage ({super.key});

  @override
  State<QualitePage> createState() => _QualitePageState();
}

class _QualitePageState extends State<QualitePage> {
  List<dynamic>? qualites;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadExperienceData();
  }

  Future<void> loadExperienceData() async {
    qualites = await getTranslatedData(context, 'qualites');
    setState(
        () {}); // Mettre à jour l'état pour reconstruire le widget avec les données chargées
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'qual')!),
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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (qualites != null)
                  for (var qualite in qualites!)
                    _itemwidget(qualite),
              ],
            ),
          ),
      ),
       ),
    );
    
  }
  Widget _itemwidget(title) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Padding(
      padding: EdgeInsets.only(left: 40),
        child : Text(title,style: TextStyle(
          fontSize: 20, // Taille de la police souhaitée
        ),),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20), 
        leading: CircleAvatar(
          backgroundColor: Colors.grey[100],
          child: Icon(Icons.check , color: Colors.black,),
        ),
      ),
      
    );
  }
}