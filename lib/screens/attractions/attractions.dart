import 'package:flutter/material.dart';
import 'package:kronborg_app/models/attraction.dart';
import '../../app.dart';
import 'attr_tile_overlay.dart';
import '../../widgets/image_banner.dart';

class Attractions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // fetch all locations
    final attractions = Attraction.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Attraktioner'),
      ),
      body: ListView.builder(
        itemCount: attractions.length,
        itemBuilder: (context, index) =>
            _itemBuilder(context, attractions[index]),
      ),
        backgroundColor: Color.fromRGBO(186, 134, 43, 1.0)
    );
  }

  // Navigate to new route --> attraction_detail()
  _onAttractionTap(BuildContext context, int attractionID) {
    Navigator.pushNamed(context, AttractionDetailRoute,
        arguments: {"id": attractionID});
  }

  // detects the usertap on a attraction and guides them to new screen with chosen ID
  Widget _itemBuilder(BuildContext context, Attraction attraction) {
    return GestureDetector(
      onTap: () => _onAttractionTap(context, attraction.id),
      key: Key('location_list_item_${attraction.id}'),
      child: Container(
        height: 230.0,
        child: Stack(
            children: [
              ImageBanner(assetPath: attraction.imagePath, height: 245.0),
              AttrTileOverlay(attraction),
            ]),
      ),
    );
  }
}