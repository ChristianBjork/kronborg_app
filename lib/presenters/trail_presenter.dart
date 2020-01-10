import 'dart:math';
import 'package:kronborg_app/models/trail.dart';
import 'package:kronborg_app/screens/trail_enabled/trail_enabled.dart';
import 'package:latlong/latlong.dart';
import 'package:mvp/mvp.dart';

class TrailPresenter extends MvpPresenter<Trail, TrailEnabled> {

  @override
  void initializeViewModel() {
    viewModel = Trail();
  }

  void increaseAttractionsVisitedByOne(double lat1, double long1, double lat2, double long2){
    if (_getDistanceFromLatLonInKm(lat1, long1, lat2, long2) < 0.50) {
      viewModel.attractionsVisited++;
      callback(viewModel);
    }
  }

  // This function is reusable code from stack overflow.
  double _getDistanceFromLatLonInKm(double lat1,double long1,double lat2, double long2) {
    var R = 6371; // Radius of the earth in km
    var dLat = _deg2rad(lat2-lat1);  // deg2rad below
    var dLon = _deg2rad(long2-long1);
    var a =
        sin(dLat/2) * sin(dLat/2) +
            cos(_deg2rad(lat1)) * cos(_deg2rad(lat2)) *
                sin(dLon/2) * sin(dLon/2)
    ;
    var c = 2 * atan2(sqrt(a), sqrt(1-a));
    var d = R * c; // Distance in km
    return d;
  }

  double _deg2rad(deg) {
    return deg * (PI/180);
  }


  
}