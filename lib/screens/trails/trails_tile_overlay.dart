import 'package:flutter/material.dart';
import 'package:kronborg_app/models/trail.dart';
import 'package:kronborg_app/widgets/trail_tile.dart';

class TrailTileOverlay extends StatelessWidget {
  final Trail trail;

  TrailTileOverlay(this.trail);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.0),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            child: TrailTile(trail: trail, darkTheme: true),
          )]
    );
  }
}