import 'package:flutter/material.dart';
import 'package:projet_cv/components/my_drawer.dart';
import 'package:projet_cv/localization/localization_constants.dart';

class ExpProfPage extends StatefulWidget {
  const ExpProfPage({super.key});

  @override
  State<ExpProfPage> createState() => _ExpProfPageState();
}

class _ExpProfPageState extends State<ExpProfPage> {
  List<dynamic>? experiences;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadExperienceData();
  }

  Future<void> loadExperienceData() async {
    experiences =
        await getTranslatedData(context, 'experience professionnelle');
    setState(
        () {}); // Mettre à jour l'état pour reconstruire le widget avec les données chargées
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'experprof')!),
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
                if (experiences != null)
                  for (var experience in experiences!)
                    _itemwidget(experience['title'], experience['lieu'], experience['date'],
                        experience['description'], experience['outils']),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemwidget(title,lieu ,date, description, outil) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                lieu,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 15,
                    width: 15,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  Text(
                    date,
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 6, top: 10),
                decoration: BoxDecoration(
                  border:
                      Border(left: BorderSide(width: 2, color: Colors.grey)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Outils : ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        outil,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
