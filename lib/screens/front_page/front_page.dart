import 'package:flutter/material.dart';

import 'fp_text_section.dart';

class FrontPage extends StatelessWidget {

  const FrontPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Kronborg'),
          ),
          body: FPTextSection(),
          backgroundColor: Color.fromRGBO(186, 134, 43, 1.0),
    );
  }
}



