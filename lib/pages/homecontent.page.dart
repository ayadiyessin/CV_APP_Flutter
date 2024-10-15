import 'package:flutter/material.dart';
import 'package:projet_cv/localization/localization_constants.dart';


class HomeContentPage extends StatefulWidget {
  const HomeContentPage({super.key});

  @override
  State<HomeContentPage> createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {

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
                      Text(
                        getTranslated(context, 'Profile')!,

                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 20,
                            height: 1.3,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
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
