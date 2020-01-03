import 'package:flutter/material.dart';
import 'package:kronborg_app/models/attraction.dart';
import 'package:kronborg_app/widgets/attraction_tile.dart';

import '../../widgets/image_banner.dart';
import 'attr_text_section.dart';


// The Screen of attraction_detail. It takes one argument which is attractionID
class AttractionDetail extends StatelessWidget {
  final int _attractionID;

  AttractionDetail(this._attractionID);

  @override
  Widget build(BuildContext context) {

    final attraction = Attraction.fetchByID(_attractionID);

    return Scaffold(
        appBar: AppBar(
          title: Text(attraction.name),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImageBanner(assetPath: attraction.imagePath),
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
                  child: AttractionTile(attraction: attraction),
                ),
              ]..addAll(textSections(attraction))),
        ),
    );
  }

  // returns a list of attraction facts with custom text style
  List<Widget> textSections(Attraction attraction) {
    return attraction.facts
        .map((fact) => AttrTextSection(fact.title, fact.text))
        .toList();
  }
}