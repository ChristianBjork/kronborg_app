import 'package:flutter/material.dart';
import 'package:kronborg_app/models/trail.dart';
import 'package:kronborg_app/style.dart';
import 'package:kronborg_app/widgets/image_banner.dart';
import '../../app.dart';
import 'trails_tile_overlay.dart';


class Trails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // fetch all locations
    final trails = Trail.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ruter'),
      ),
      body: ListView.builder(
        itemCount: trails.length,
        itemBuilder: (context, index) =>
            _itemBuilder(context, trails[index]),
      ),
      backgroundColor: BackgroundColor,
    );
  }

  // Navigates to new screen --> trail_detail()
  _onTrailTap(BuildContext context, int trailID) {
    Navigator.pushNamed(context, TrailDetailRoute,
        arguments: {"id": trailID});
  }

  // detects the userTap on a trail and guides them to new screen with chosen ID
  Widget _itemBuilder(BuildContext context, Trail trail) {
    return GestureDetector(
      onTap: () => _onTrailTap(context, trail.id),
      key: Key('location_list_item_${trail.id}'),
      child: Container(
        height: 245.0,
        child: Stack(
            children: [
              ImageBanner(assetPath: trail.imagePath, height: 245.0),
              TrailTileOverlay(trail),
            ]),
      ),
    );
  }
}