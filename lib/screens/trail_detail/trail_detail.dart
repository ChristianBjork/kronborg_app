import 'package:flutter/material.dart';
import 'package:kronborg_app/models/trail.dart';
import 'package:kronborg_app/style.dart';
import 'package:kronborg_app/widgets/image_banner.dart';
import 'package:kronborg_app/widgets/trail_tile.dart';
import '../../app.dart';
import 'trail_text_section.dart';

// The Screen of attraction_detail. It takes one argument which is trailID
class TrailDetail extends StatelessWidget {

  final int _trailID;

  TrailDetail(this._trailID);

  @override
  Widget build(BuildContext context) {
    final trail = Trail.fetchByID(_trailID);
    return Scaffold(
        appBar: AppBar(
          title: Text(trail.name),
        ),
        backgroundColor: BackgroundColor,
        body:
          SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
                    child: TrailTile(trail: trail),
                  ),
                  ImageBanner(assetPath: trail.imagePath),
                ]..addAll(textSections(trail))),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.directions_run, color: BackgroundColor,),
                  backgroundColor: Colors.white,
                  tooltip: 'Start Rute',
                  onPressed: () {
                    _onStartTrailTap(context, trail.id);
                  },),
//        bottomNavigationBar: BottomAppBar(
//          shape: CircularNotchedRectangle(),
//          notchMargin: 4.0,
//          child: new Row(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
////                IconButton(icon: Icon(Icons.explore),
////                  iconSize: 35,
////                  color: Color.fromRGBO(128, 85, 0, 1.0),
////                  onPressed: () {},),
//              ],
//          ),
//        ),
    );
  }

  // returns a list of attraction facts with custom text style
  List<Widget> textSections(Trail trail) {
    return trail.facts
        .map((fact) => TrailTextSection(fact.title, fact.text))
        .toList();
  }

  // Navigates to new screen --> trailEnabled()
  _onStartTrailTap(BuildContext context, int trailID) {
    Navigator.pushNamed(context, TrailEnabledRoute,
        arguments: {"id": trailID});
  }

}