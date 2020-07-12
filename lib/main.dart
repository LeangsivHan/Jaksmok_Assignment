import 'package:assignment_jaksmok_app/assets/colors/colors.dart';
import 'package:assignment_jaksmok_app/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
        },
      ),
      title: new Text(
        'JAKSMOK Assignment',
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
      ),
      image: Image(
        image: AssetImage('lib/assets/pngs/Jaksmok_logo.png'),
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width * 0.45,
      ),
      gradientBackground: new LinearGradient(
          colors: [base_color, Colors.blue[900]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("SplashScreen"),
      loaderColor: Colors.white,
      loadingText: Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
