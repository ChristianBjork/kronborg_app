import 'package:flutter/material.dart';
import '../../style.dart';

class FPTextSection extends StatelessWidget {
  final String _title = 'Velkommen til Kronborgs \nRute og informations App';
  final String _body =
      'Kronborgs Rute App tilbyder dig en guidet tur omkring Kronborg, hvor der er mulighed for at besøge de flotte attraktioner, som ligger nær slottet. '
      '\nDu har mulighed for at vælge mellem 2 ruter, som giver dig informationer om de attraktioner, som du bevæger dig nær, osv osv osv ';

  FPTextSection();

  static const double _hPad = 16.0;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: new EdgeInsets.symmetric(vertical: 60.0),
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/kronborg-slot.png'),
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 4.0),
            child: Text(_title, style: TitleTextStyleLight)),
        Container(
            padding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: _hPad),
            child: Text(_body, style: SubTitleTextStyle)),

      ],
    );
  }
}