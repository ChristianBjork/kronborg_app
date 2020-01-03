import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kronborg_app/models/attraction.dart';
import 'package:kronborg_app/models/map_location.dart';
import 'package:kronborg_app/models/trail.dart';
import 'package:kronborg_app/style.dart';
import 'package:latlong/latlong.dart';

import 'package:provider/provider.dart';

class TrailEnabled extends StatefulWidget {

  final int _trailID;
  const TrailEnabled(this._trailID);

  @override
  _TrailEnabledState createState() => _TrailEnabledState();
}

class _TrailEnabledState extends State<TrailEnabled> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final trail = Trail.fetchByID(widget._trailID);
    final attractions = Attraction.fetchAll();
    var _currentLocation = Provider.of<MapLocation>(context);
    return new Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text(trail.name),
        ),
        body: FlutterMap(
          options: new MapOptions(
            center: new LatLng(56.0387192, 12.61621),
            //center: new LatLng(_currentLocation.latitude, _currentLocation.longitude),
            zoom: 18.0),
            layers: [
              //Get map from mapbox API
              new TileLayerOptions(
                urlTemplate:
                'https://api.mapbox.com/styles/v1/bjoerksen/ck3sr2a3k0ah81cochbw0ym39/tiles/256/{z}/{x}/{y}@2x?access_token='
                    'pk.eyJ1IjoiYmpvZXJrc2VuIiwiYSI6ImNrM3JxeDdhcDBkeHkzanM1cDlqdXd2YnQifQ.ol3Os0vZ8KUGuTDAeePB-w',
                additionalOptions: {
                  'accessToken': 'pk.eyJ1IjoiYmpvZXJrc2VuIiwiYSI6ImNrM3JxeDdhcDBkeHkzanM1cDlqdXd2YnQifQ.ol3Os0vZ8KUGuTDAeePB-w',
                  'id': 'mapbox.mapbox-streets-v8'
                }
              ),
              new PolylineLayerOptions(
                  polylines: [
                    new Polyline(
                        points: trail.mapLocations,
                        strokeWidth: 5.0,
                        color: BackgroundColor
                    )
                  ]),
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(_currentLocation.latitude, _currentLocation.longitude),
                    builder: (ctx) =>
                             Container(
                              child: GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Dette er din nuværende position'),backgroundColor: Color.fromRGBO(186, 134, 43, 1.0),
                                  ));
                                },
                                child: Icon(Icons.my_location, color: Colors.blue,),
                              ),
                             ),
              ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: trail.mapLocations[0],
                    builder: (ctx) => Icon(Icons.adjust, color: Colors.green,),
                  ),
                  new Marker(
                      width: 45.00,
                      height: 45.00,
                      point: new LatLng(trail.endLocation.latitude, trail.endLocation.longitude),
                      builder: (ctx) => Icon(Icons.adjust, color: Colors.orange,)
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[1].mapLocation,
                    builder: (ctx) =>
                    Container(
                      child: GestureDetector(
                        onTap: () => _popupDialog(context, attractions[1].name),
                        child: Icon(Icons.location_on, color: Colors.brown),
                      ),
                    ),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[2].mapLocation,
                    builder: (ctx) => Icon(Icons.location_on, color: Colors.brown),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[3].mapLocation,
                    builder: (ctx) => Icon(Icons.location_on, color: Colors.brown),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[4].mapLocation,
                    builder: (ctx) => Icon(Icons.location_on, color: Colors.brown),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[5].mapLocation,
                    builder: (ctx) => Icon(Icons.location_on, color: Colors.brown)
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[6].mapLocation,
                    builder: (ctx) => Icon(Icons.location_on, color: Colors.brown),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[7].mapLocation,
                    builder: (ctx) => Icon(Icons.location_on, color: Colors.brown),
                  ),
            ]),
        ],),
    );
  }

  // Alert dialog
  void _popupDialog(BuildContext context, String title) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title), titleTextStyle: TitleTextStyle,
            content: Text('Vil du vide mere on denne attraction?'), contentTextStyle: Body1TextStyle,
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Nej')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Ja')),
            ],

          );
        });
  }
}
