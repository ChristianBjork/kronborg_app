import 'package:flutter/material.dart';
import 'package:kronborg_app/models/attraction.dart';
import 'package:kronborg_app/widgets/attraction_tile.dart';



// transparent overlay over the picture
class AttrTileOverlay extends StatelessWidget {
  final Attraction attraction;

  AttrTileOverlay(this.attraction);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.0),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            child: AttractionTile(attraction: attraction, darkTheme: true),
          )]
    );
  }
}
