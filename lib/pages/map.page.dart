import 'package:flutter_map/flutter_map.dart';
import 'package:projet_cv/localization/localization_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'map')!),
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

      body: Card(
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(34.775127, 10.716524),
            initialZoom: 15.2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                ),
              ],
            ),
            MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point:  LatLng(34.775127, 10.716524),
                    child: Icon(Icons.location_on, color: Colors.red,size: 60,),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
