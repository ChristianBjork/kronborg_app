import 'package:flutter/material.dart';

import '../../style.dart';

class FPTextSection extends StatelessWidget {
  final String _title = 'Velkommen til Kronborgs Rute App';
  final String _body =
      'Kronborgs Rute App tilbyder dig en guidet tur omkring Kronborg, hvor der er mulighed for at besøge de flotte attraktioner, som ligger nær slottet. '
      'Du har mulighed for at vælge mellem 2 ruter, som giver dig informationer om de attraktioner, som du bevæger dig nær, osv osv osv ';

  FPTextSection();

  static const double _hPad = 16.0;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
            child: Text(_title, style: FPTitleTextStyle)),
        Container(
            padding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: _hPad),
            child: Text(_body, style: SubTitleTextStyle)),
      ],
    );
  }
}