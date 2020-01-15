import 'package:flutter/material.dart';
import '../../style.dart';

class FPTextSection extends StatelessWidget {
  final String _title = 'Velkommen til Kronborgs \nRute og informations App';
  final String _body =
      'Kronborgs Rute App tilbyder dig en guidet tur, hvor du kan vælge mellem 3 forskellige ruter, som viser vej omkring slottet. \nHer bliver du guidet hen til en række af forskellige beundringsværdige attraktioner.'
      '\n\nDerudover har du muligheder for at læse om attraktionerne og deres historie, så du dermed får noget viden, om den attraktion du skuer på.';

  FPTextSection();

  static const double _hPad = 16.0;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: new EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 20.0),
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