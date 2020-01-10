import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kronborg_app/models/attraction.dart';
import 'package:kronborg_app/models/map_location.dart';
import 'package:kronborg_app/models/trail.dart';
import 'package:kronborg_app/presenters/trail_presenter.dart';
import 'package:kronborg_app/style.dart';
import 'package:latlong/latlong.dart';
import 'package:mvp/mvp.dart';
import 'package:provider/provider.dart';

class TrailEnabled extends StatefulWidget {
  final presenter = TrailPresenter();

  final int trailID;
  TrailEnabled({this.trailID, Key key}): super (key:key);

  @override
  TrailEnabledState createState() => TrailEnabledState();
}

class TrailEnabledState extends MvpScreen<TrailEnabled, Trail> {

  //String _platformVersion = "Unknown";

  @override
  void initializeViewModel() {
    viewModel = Trail();
  }

  @override
  void initState(){
    super.initState();

    // binding the view to the presenter
    widget.presenter.bind(applyState, TrailEnabled());

    // Enabling social share
    //initPlatformState();
  }

//  // Platform messages are asynchronous, so we initialize in an async method.
//  Future<void> initPlatformState() async {
//    String platformVersion;
//    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      platformVersion = await SocialSharePlugin.platformVersion;
//    } on PlatformException {
//      platformVersion = 'Failed to get platform version.';
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    setState(() {
//      _platformVersion = platformVersion;
//    });
//  }


  @override
  void dispose() {
    super.dispose();
    // Releasing presenter binding
    widget.presenter.unbind();
  }

  double attractionIconSize = 50.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final trail = Trail.fetchByID(widget.trailID);
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
              //Get map from MapBox API
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
                    point: trail.mapLocations.first,
                    builder: (ctx) => Icon(Icons.adjust, color: Colors.green,),
                  ),
                  new Marker(
                      width: 45.00,
                      height: 45.00,
                      point: new LatLng(trail.mapLocations.last.latitude, trail.mapLocations.last.longitude),
                      builder: (ctx) =>
                          Container(
                            child: GestureDetector(
                              onTap: () => _showAlertDialog(),
                              child: Icon(Icons.adjust, color: Colors.orange,),
                            ),
                          ),

                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[1].mapLocation,
                    builder: (ctx) =>
                    Container(
                      child: GestureDetector(
                        onTap: () => _showAttraction(context, attractions[1].name,attractions[1].facts[0].text, attractions[1].imagePath, _currentLocation.latitude, _currentLocation.longitude, attractions[1].mapLocation.latitude, attractions[1].mapLocation.longitude),
                        child: Icon(Icons.location_on, color: Colors.brown, size: attractionIconSize,),
                      ),
                    ),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[2].mapLocation,
                    builder: (ctx) =>
                        Container(
                          child: GestureDetector(
                            onTap: () => _showAttraction(context, attractions[2].name, attractions[2].facts[0].text, attractions[2].imagePath, _currentLocation.latitude, _currentLocation.longitude, attractions[2].mapLocation.latitude, attractions[2].mapLocation.longitude),
                            child: Icon(Icons.location_on, color: Colors.brown, size: attractionIconSize,),
                          ),
                        ),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[3].mapLocation,
                    builder: (ctx) =>
                        Container(
                          child: GestureDetector(
                            onTap: () => _showAttraction(context, attractions[3].name, attractions[3].facts[0].text, attractions[3].imagePath, _currentLocation.latitude, _currentLocation.longitude, attractions[3].mapLocation.latitude, attractions[3].mapLocation.longitude),
                            child: Icon(Icons.location_on, color: Colors.brown, size: attractionIconSize,),
                          ),
                        ),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[4].mapLocation,
                    builder: (ctx) =>
                        Container(
                          child: GestureDetector(
                            onTap: () => _showAttraction(context, attractions[4].name, attractions[4].facts[0].text, attractions[4].imagePath, attractions[5].mapLocation.latitude, attractions[5].mapLocation.longitude, attractions[4].mapLocation.latitude, attractions[4].mapLocation.longitude),
                            child: Icon(Icons.location_on, color: Colors.brown, size: attractionIconSize),
                          ),
                        ),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[5].mapLocation,
                    builder: (ctx) =>
                        Container(
                          child: GestureDetector(
                            onTap: () => _showAttraction(context, attractions[5].name, attractions[5].facts[0].text, attractions[5].imagePath, _currentLocation.latitude, _currentLocation.longitude, attractions[5].mapLocation.latitude, attractions[5].mapLocation.longitude),
                            child: Icon(Icons.location_on, color: Colors.brown, size: attractionIconSize),
                          ),
                        ),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[6].mapLocation,
                    builder: (ctx) =>
                        Container(
                          child: GestureDetector(
                            onTap: () => _showAttraction(context, attractions[6].name, attractions[6].facts[0].text, attractions[6].imagePath, _currentLocation.latitude, _currentLocation.longitude, attractions[6].mapLocation.latitude, attractions[6].mapLocation.longitude),
                            child: Icon(Icons.location_on, color: Colors.brown, size: attractionIconSize),
                          ),
                        ),
                  ),
                  new Marker(
                    width: 45.00,
                    height: 45.00,
                    point: attractions[7].mapLocation,
                    builder: (ctx) =>
                        Container(
                          child: GestureDetector(
                            onTap: () => _showAttraction(context, attractions[7].name, attractions[7].facts[0].text, attractions[7].imagePath, _currentLocation.latitude, _currentLocation.longitude, attractions[7].mapLocation.latitude, attractions[7].mapLocation.longitude),
                            child: Icon(Icons.location_on, color: Colors.brown, size: attractionIconSize)
                          ),
                        ),
                  ),
            ]),
        ],),
    );
  }

  void _showAttraction(BuildContext context, String title, String description, String imagePath, double lat1, double long1, double lat2, double long2){

    // distance to attraction tracker
    widget.presenter.increaseAttractionsVisitedByOne(lat1, long1, lat2, long2);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 600.0,
            width: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 150.0,
                    ),
                    Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        color: BackgroundColor
                      ),
                    ),
                    Positioned(
                      top: 50.0,
                      left: 94.0,
                      child: Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(65.0),
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(title, style: TitleTextStyleDark),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(description, style: Body1TextStyle),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child:
                      FloatingActionButton.extended(
                        label: Text("Tilbage, ${viewModel.attractionsVisited}", style: SubTitleTextStyle),
                        onPressed: () {
                        Navigator.of(context).pop();
                        },
                        backgroundColor: BackgroundColor,
                      )
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }


  void _showAlertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("MÅL"),
          content: new Text("Du har gennemført en kronborg rute, og besøgt ${viewModel.attractionsVisited} attraktioner, vil du dele aktiviteten på fx?"),
          actions: <Widget>[
            FlatButton(
              child: Icon(FontAwesomeIcons.facebook),
              onPressed: () async {
                //Share.text('KRONBORG', 'I visited ${viewModel.attractionsVisited} attractions', 'text/plain');
              },
            )
          ],
        );
      }
    );
  }
}
