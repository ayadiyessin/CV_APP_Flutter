
import 'package:flutter/material.dart';
import 'package:projet_cv/localization/localization_constants.dart';
import 'package:projet_cv/pages/map.page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage ({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(20), // hetha couleur mte3 3D
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FadeInImage(
                        fadeInCurve: Curves.easeInOut,
                        fit: BoxFit.contain,
                        height: 180,
                        width: double.infinity,
                        image: AssetImage('lib/images/yessin.jpg'),
                        placeholder: AssetImage('lib/images/yessin.jpg'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(height: 4, color: Colors.blueGrey),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        getTranslated(context, 'nom')!,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 24,
                            height: 1.3,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [

                          Icon(Icons.mail, size: 30,),
                          SizedBox(width: 15,),
                          Flexible(
                            child: Text(
                              getTranslated(context, 'email')!,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 20,
                                  height: 1.3,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          
                        ],
                      ),
                      
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        
                        children: [

                          Icon(Icons.link, size: 30,),
                          SizedBox(width: 15,),
                          Flexible(
                            child: Text(
                            getTranslated(context, 'linkedin')!,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 20,
                                height: 1.3,
                                fontWeight: FontWeight.w500),
                          ),
                          ),
                          
                        ],
                      ),
                      
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [

                          Icon(Icons.phone, size: 30,),
                          SizedBox(width: 15,),
                          
                          Text(
                            getTranslated(context, 'telephone')!,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 20,
                                height: 1.3,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      
                      SizedBox(
                        height: 10,
                      ),
                      Divider(height: 4, color: Colors.blueGrey),
                      
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.maps_home_work, size: 30,),
                          SizedBox(width: 15,),

                          
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>MapPage()), 
                              );
                            },
                            child: 
                            Text(
                              getTranslated(context,
                                  'adresse')!,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 20,
                                height: 1.3,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          //SizedBox(width: 17), // Ajoutez un espace entre les deux icônes
                          //Icon(Icons.keyboard_arrow_right, size: 30,),
                          
                        ],
                      ),
                      
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}