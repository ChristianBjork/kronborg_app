import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/map_location.dart';
import 'screens/attraction_detail/attraction_detail.dart';
import 'screens/attractions/attractions.dart';
import 'screens/front_page/front_page.dart';
import 'screens/trail_detail/trail_detail.dart';
import 'screens/trail_enabled/trail_enabled.dart';
import 'screens/trails/trails.dart';
import 'services/location_service.dart';
import 'style.dart';

const FrontPageRoute = '/';
const TrailDetailRoute = '/trail_detail';
const AttractionDetailRoute = '/attraction_detail';
const TrailEnabledRoute = '/trail_enabled';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome is used to make sure that the app doesn't rotate
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // StreamProvider allows us to make use of the user location.
    return StreamProvider<MapLocation>(
        // ignore: deprecated_member_use
        builder: (context) => LocationService().locationStream,
        child: MaterialApp(
          home: new MyApp(),
        ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Open app on FrontPage
  int _selectedPage = 1;
  final _pageOptions = [
    Trails(),
    FrontPage(),
    Attractions(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
      home: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.map),
                title: Text('Ruter')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Hjem')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.landscape),
                title: Text('Attraktioner')
            ),
          ],),
      ),
    );
  }

  // This is how dynamic routes are defined
  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case FrontPageRoute:
          screen = FrontPage();
          break;
        case TrailDetailRoute:
          screen = TrailDetail(arguments['id']);
          break;
        case AttractionDetailRoute:
          screen = AttractionDetail(arguments['id']);
          break;
        case TrailEnabledRoute:
          screen = TrailEnabled(trailID: arguments['id'],);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }


  // This is the theme of the App
  ThemeData _theme() {
    return ThemeData(
      primaryColor: Color.fromRGBO(128, 85, 0, 1.0),
      appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
      textTheme: TextTheme(
        title: TitleTextStyleDark,
        subtitle: SubTitleTextStyle,
        body1: Body1TextStyle,
      ),
    );
  }
}