import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Map Application'),
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
              options: new MapOptions(
                  zoom: 16.0, center: LatLng(23.831457, 91.286781)),
              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
                new MarkerLayerOptions(markers: [
                  new Marker(
                      width: 45.0,
                      height: 45.0,
                      point: LatLng(23.831457, 91.286781),
                      builder: (context) => new Container(
                            child: IconButton(
                                icon: Icon(Icons.location_on),
                                iconSize: 40,
                                color: Colors.blue,
                                onPressed: () {
                                  print('Marker tapped!');
                                }),
                          )),
                ]),
              ]),
        ],
      ),
    );
  }
}
