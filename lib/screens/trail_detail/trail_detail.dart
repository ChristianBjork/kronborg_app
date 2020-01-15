import 'package:flutter/material.dart';
import 'package:kronborg_app/models/trail.dart';
import 'package:kronborg_app/screens/trail_enabled/trail_enabled.dart';
import 'package:kronborg_app/style.dart';
import 'package:kronborg_app/widgets/image_banner.dart';
import 'package:kronborg_app/widgets/trail_tile.dart';
import '../../app.dart';
import 'trail_text_section.dart';

// The Screen of attraction_detail. It takes one argument which is trailID
class TrailDetail extends StatelessWidget {

  final int trailID;

  TrailDetail({this.trailID, Key key}): super (key:key);

  @override
  Widget build(BuildContext context) {
    final trail = Trail.fetchByID(trailID);
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
//                  Padding(
//                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
//                    child: TrailTile(trail: trail),
//                  ),
                  ImageBanner(assetPath: trail.imagePath),
                ]..addAll(textSections(trail))),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
                  child: FloatingActionButton(
                      child: Icon(Icons.directions_run, color: BackgroundColor,),
                          backgroundColor: Colors.white,
                          tooltip: 'Start Rute',
                          onPressed: () {
                            _onStartTrailTap(context, trail.id);
                          },
                  ),
          )
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