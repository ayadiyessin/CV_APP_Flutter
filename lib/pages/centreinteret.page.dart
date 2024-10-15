import 'package:flutter/material.dart';
import 'package:projet_cv/components/my_drawer.dart';
import 'package:projet_cv/localization/localization_constants.dart';

class CentreInteretPage extends StatefulWidget {
  const CentreInteretPage({super.key});

  @override
  State<CentreInteretPage> createState() => _CentreInteretPageState();
}

class _CentreInteretPageState extends State<CentreInteretPage> {
  List<dynamic>? centerints;

  List<IconData> icons = [
    Icons.sports_soccer,
    Icons.videogame_asset,
    Icons.music_note,
    Icons.computer
    // Ajoutez d'autres icônes selon vos besoins
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadExperienceData();
  }

  Future<void> loadExperienceData() async {
    centerints = await getTranslatedData(context, 'centres interets');
    setState(
        () {}); // Mettre à jour l'état pour reconstruire le widget avec les données chargées
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'inter')!),
        backgroundColor: Colors.blueGrey,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
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
                if (centerints != null)
                  for (var centent in centerints!)
                    _itemwidget(centent,icons[centerints!.indexOf(centent)]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemwidget(title, icons) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Padding(
      padding: EdgeInsets.only(left: 50),
        child : Text(title,style: TextStyle(
          fontSize: 20, // Taille de la police souhaitée
        ),),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20), 
        leading: CircleAvatar(
          backgroundColor: Colors.grey[100],
          child: Icon(icons , color: Colors.black,),
        ),
      ),
      
    );
  }
}
