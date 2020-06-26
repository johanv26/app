//import 'package:app_login_ui/screens/get_cities.dart';
import 'package:app_login_ui/screens/get_cities.dart';
import 'package:app_login_ui/screens/get_rss.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/domain/media/text.dart';
//import 'package:flutter/services.dart';

import './screens/getting_started_screen.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';


void main() {
    runApp(MyApp());
    //citiesProvider.getCities().then((value) => print(value));
    //print(citiesList);
    //GetRss.newsContent();

}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeakU App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GettingStartedScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
      },
    );
  }
}
