import 'package:flutter/material.dart';
import 'package:kronborg_app/models/trail.dart';
import '../style.dart';

const TrailTileHeight = 100.0;

class TrailTile extends StatelessWidget {
  final Trail trail;
  final bool darkTheme;

  TrailTile({this.trail, this.darkTheme = true});

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
      height: TrailTileHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trail.name.toUpperCase(),
              key: Key('route_tile_name_${trail.id}'),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.title.copyWith(color: textColor),
            ),
            Text(
              '${trail.lengthKM} km'.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle,
            )
          ]),
    );
  }
}