import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../../style.dart';


// This is taken out of the app, mapbox is way better to use.
class WebMap extends StatefulWidget {
  @override
  _WebMapState createState() => _WebMapState();
}

class _WebMapState extends State<WebMap> {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  final String trailMap = 'https://app.lap.io/event/2018-tracking/replay';

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.evalJavascript("alert('Inducesmile)");
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(
          'Map'
        ),
      ),
      url: trailMap,
      withZoom: false,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: BackgroundColor,
        child: const Center(
            child: Text('Waiting.....'),
        ),
      ),
      withJavascript: true,
      bottomNavigationBar: BottomNavigationBar(
        items: [
        BottomNavigationBarItem(
          title: Text('play'),
          icon: Icon(Icons.play_arrow),
        ),
        BottomNavigationBarItem(
          title: Text('add'),
          icon: Icon(Icons.add)
        ),
        ],
      ),
    );
  }
}
