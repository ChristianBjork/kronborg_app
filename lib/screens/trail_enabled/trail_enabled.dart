import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kronborg_app/app.dart';
import 'package:kronborg_app/models/attraction.dart';
import 'package:kronborg_app/models/map_location.dart';
import 'package:kronborg_app/models/trail.dart';
import 'package:kronborg_app/presenters/trail_presenter.dart';
import 'package:kronborg_app/screens/trails/trails.dart';
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

  @override
  void initializeViewModel() {
    viewModel = Trail();
  }

  @override
  void initState(){
    super.initState();

    // binding the view to the presenter
    widget.presenter.bind(applyState, TrailEnabled());
  }

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
            actions: <Widget>[
              FlatButton.icon(
                  icon: Icon(Icons.location_on, color: Colors.white,),
                  label: Text('${viewModel.attractionsVisited}/8', style: SubTitleTextStyle,))
        // action button
            ]
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
                              onTap: () => _showFinishDialog(trail, _currentLocation),
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
                        onTap: () => _showAttraction(context, attractions[1], _currentLocation.latitude, _currentLocation.longitude, attractions[1].mapLocation.latitude, attractions[1].mapLocation.longitude),
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
                            onTap: () => _showAttraction(context, attractions[2], _currentLocation.latitude, _currentLocation.longitude, attractions[2].mapLocation.latitude, attractions[2].mapLocation.longitude),
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
                            onTap: () => _showAttraction(context, attractions[3], _currentLocation.latitude, _currentLocation.longitude, attractions[3].mapLocation.latitude, attractions[3].mapLocation.longitude),
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
                            onTap: () => _showAttraction(context, attractions[4], _currentLocation.latitude, _currentLocation.longitude, attractions[4].mapLocation.latitude, attractions[4].mapLocation.longitude),
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
                            onTap: () => _showAttraction(context, attractions[5], _currentLocation.latitude, _currentLocation.longitude, attractions[5].mapLocation.latitude, attractions[5].mapLocation.longitude),
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
                            onTap: () => _showAttraction(context, attractions[6], _currentLocation.latitude, _currentLocation.longitude, attractions[6].mapLocation.latitude, attractions[6].mapLocation.longitude),
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
                            onTap: () => _showAttraction(context, attractions[7], _currentLocation.latitude, _currentLocation.longitude, attractions[7].mapLocation.latitude, attractions[7].mapLocation.longitude),
                            child: Icon(Icons.location_on, color: Colors.brown, size: attractionIconSize)
                          ),
                        ),
                  ),
            ]),
        ],),
    );
  }

  void _showAttraction(BuildContext context, Attraction attraction, double lat1, double long1, double lat2, double long2){

    // This function is only executed if the user is within a certain distance from an attraction
    widget.presenter.increaseAttractionsVisitedByOne(lat1, long1, lat2, long2);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 500.0,
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
                            image: AssetImage(attraction.imagePath),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(attraction.name, style: TitleTextStyleDark),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(attraction.facts[0].text, style: Body1TextStyle),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child:
                      FloatingActionButton.extended(
                        label: Text("Tilbage", style: SubTitleTextStyle),
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


  void _showFinishDialog(Trail trail, MapLocation currentLocation,){
    if(widget.presenter.isInGoalRange(currentLocation.latitude, currentLocation.longitude, trail.mapLocations.last.latitude, trail.mapLocations.last.longitude) == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("VELKOMMEN I MÅL", style: TitleTextStyleDark,),
              content: new Text("Du har gennemført kronborg ruten ${trail
                  .name} som strækker sig på ${trail
                  .lengthKM}km. \nDu besøgte ${viewModel
                  .attractionsVisited} attraktioner som befandt sig nær denne interessante rute",
                style: CaptionTextStyle,),
              actions: <Widget>[
                FlatButton(
                  child:
                  Text('Find Ny Rute',
                    style: TextStyle(fontFamily: FontNameDefault,
                        fontWeight: FontWeight.w300,
                        fontSize: LargeTextSize,
                        color: BackgroundColor),),
                  //Icon(FontAwesomeIcons.backward, color: BackgroundColor,),
                  onPressed: () {
                    Navigator.pushNamed(context, FrontPageRoute);
                  },
                ),
                FlatButton(
                  child:
                  Text('Del', style: TextStyle(fontFamily: FontNameDefault,
                      fontWeight: FontWeight.w300,
                      fontSize: LargeTextSize,
                      color: BackgroundColor),),
                  //Icon(FontAwesomeIcons.share, color: BackgroundColor,),
                  onPressed: () {
                    Share.text(
                        'Kronborg Ruter',
                        'Jeg har netop gennemført en af Kronborgs spændende vandrings ruter, hvor jeg besøgte ${viewModel
                            .attractionsVisited} flotte og beundringsværdige attraktioner, '
                            'så som Han statuen og The Garbage fish, som består af efterladt skrald.',
                        'text/plain');
                    Navigator.pushNamed(context, FrontPageRoute);
                  },
                )
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
            );
          }
      );
    }
  }
}
