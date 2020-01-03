import 'dart:async';

// info about location package at: https://pub.dev/packages/location

import 'package:kronborg_app/models/map_location.dart';
import 'package:location/location.dart';


class LocationService {

  // Keep track of current Location
  MapLocation _currentLocation;

  // Instance of location package
  Location location = Location();

  // Continuously emit location updates
  StreamController<MapLocation> _locationController =
  StreamController<MapLocation>.broadcast();


  LocationService() {
    // Request permission to use location
    // return a boolean (granted) to know if the permission has been granted
    location.requestPermission().then((granted) {

      // If granted listen to the onLocationChanged stream and emit over the controller
      if (granted) {
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(MapLocation(
                latitude: locationData.latitude,
                longitude: locationData.longitude,
            ));
          }
        });
      }
    });
  }

  // get the stream of the users location
  Stream<MapLocation> get locationStream => _locationController.stream;

  // Allow get a one time position of the user
  Future<MapLocation> getLocation() async{
    try{
      var userLocation = await location.getLocation();
      _currentLocation = MapLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
      // If location could not be found
    } on Exception catch (e){
      print('Could not get the location: ${e.toString()}');
      _currentLocation = null;
    }

    return _currentLocation;
  }
}