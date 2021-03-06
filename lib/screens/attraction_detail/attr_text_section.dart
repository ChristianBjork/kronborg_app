import 'package:flutter/material.dart';
import 'package:kronborg_app/style.dart';

// This widget sets the title and body of the description of an attraction.
class AttrTextSection extends StatelessWidget {
  final String _title;
  final String _body;
  static const double _hPad = 16.0;

  AttrTextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
            child: Text(_title, style: TitleTextStyleLight)),
        Container(
            padding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: _hPad),
            child: Text(_body, style: SubTitleTextStyle,)),
      ],
    );
  }
}