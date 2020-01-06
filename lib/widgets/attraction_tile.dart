import 'package:flutter/material.dart';
import 'package:kronborg_app/models/attraction.dart';
import '../style.dart';

const AttractionTileHeight = 100.0;

class AttractionTile extends StatelessWidget {
  final Attraction attraction;
  final bool darkTheme;

  AttractionTile({this.attraction, this.darkTheme = false});

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
      height: AttractionTileHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              attraction.name.toUpperCase(),
              key: Key('location_tile_name_${attraction.id}'),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.title.copyWith(color: textColor),
            ),
          ]),
    );
  }
}