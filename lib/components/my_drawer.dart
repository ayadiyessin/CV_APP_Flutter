import 'package:flutter/material.dart';
import 'package:projet_cv/localization/localization_constants.dart';

class MyDrawer extends StatelessWidget{

  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("lib/images/yessin.jpg"),
                    radius: 80,
                  ),
                ),
              ),
              

          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blueGrey,
              ),
              title: Text(getTranslated(context, 'homedraw')!),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
          ),
          
          Divider(height: 4, color: Colors.blueGrey),

          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: ListTile(
              leading: Icon(
                Icons.workspace_premium_outlined,
                color: Colors.blueGrey,
              ),
              title: Text(getTranslated(context, 'experprofdraw')!),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/expProf');
              },
            ),
          ),

          Divider(height: 4, color: Colors.blueGrey),

          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: ListTile(
              leading: Icon(
                Icons.work,
                color: Colors.blueGrey,
              ),
              title: Text(getTranslated(context, 'experacaddraw')!),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/expAcad');
              },
            ),
          ),

          Divider(height: 4, color: Colors.blueGrey),

          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: ListTile(
              leading: Icon(
                Icons.school,
                color: Colors.blueGrey,
              ),
              title: Text(getTranslated(context, 'dipldraw')!),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/diplome');
              },
            ),
          ),

          Divider(height: 4, color: Colors.blueGrey),

          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: ListTile(
              leading: Icon(
                Icons.language,
                color: Colors.blueGrey,
              ),
              title: Text(getTranslated(context, 'langdraw')!),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/langue');
              },
            ),
          ),

          Divider(height: 4, color: Colors.blueGrey),

          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: ListTile(
              leading: Icon(
                Icons.build,
                color: Colors.blueGrey,
              ),
              title: Text(getTranslated(context, 'compdraw')!),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/competence');
              },
            ),
          ),

          Divider(height: 4, color: Colors.blueGrey),

          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.blueGrey,
              ),
              title: Text(getTranslated(context, 'qualdraw')!),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/qualite');
              },
            ),
          ),

          Divider(height: 4, color: Colors.blueGrey),

          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.blueGrey,
              ),
              title: Text(getTranslated(context, 'interdraw')!),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/centreInter');
              },
            ),
          ),
            ],
          ),

          
          Padding(
            padding: const EdgeInsets.only(left:40.0, bottom: 25),
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blueGrey,
              ),
              title: Text(getTranslated(context, 'settidraw')!),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/setting');
              },
            ),
          ),
        ],
      ),
    );
  }
}