import 'package:flutter/material.dart';
import 'package:flutter2/Page/Homepage/home.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

//File Page Includ
import 'Page/Homepage/home.dart';
import 'Page/Homepage/profile.dart';
import 'Page/LoginPage/login.dart';
import './Page/LoginPage/login.dart';
import './Page/LoginPage/LoginPending.dart';
import './Page/HomePage/MyHomePage.dart';
import './Model/SocialAccount.dart' as localuser;
import './Model/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static localuser.User currentUser;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    FlutterStatusbarcolor.setStatusBarColor(Constants().app_color);
    return MaterialApp(
      title: 'Fluffy',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      //LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/home': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}
