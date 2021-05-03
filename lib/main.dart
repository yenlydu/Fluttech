import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Page/Admin/FindUsersPage/FindUsersPage.dart';
import 'package:flutter2/Mobile/Page/CommonBackground.dart';
import 'package:flutter2/Mobile/Page/Homepage/home.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter2/Web/login.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter2/Mobile/Page/Admin/FindUsersPage/FindUsersPage.dart';

//File Page Includ
import 'Mobile/Page/Homepage/home.dart';
import 'Mobile/Page/ProfilePage/Profile.dart';
import 'Mobile/Page/CalendarPage/Calendar.dart';
import 'Mobile/Page/NotificationsPage/Notifications.dart';
import './Mobile/Page/LoginPage/login.dart';
import './Mobile/Page/Admin/LoginPage/adminLoginPage.dart';
import './Mobile/Page/LoginPage/LoginPending.dart';
import './Mobile/Page/HomePage/Nav.dart';
import 'package:flutter2/Model/SocialAccount.dart' as localuser;
import 'package:flutter2/Model/Constants.dart';

import 'package:flutter2/Web/homeAdmin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
//  MyMobileState createState() => MyMobileState();
  //Launch web
    MyWebState createState() => MyWebState();
}

class MyWebState extends State <MyApp>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: "FluTECH",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MyMobileState extends State<MyApp> with WidgetsBindingObserver {
  static localuser.User currentUser;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    FlutterStatusbarcolor.setStatusBarColor(Constants().app_color);
    return MaterialApp(
      title: 'FlutTECH',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      //LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/home': (BuildContext context) => new NavElem(),
        '/admin/login': (BuildContext contect) => new AdminLoginPage(),
        '/admin/findUsers': (BuildContext contect) => new FindUsersPage(),

      },
    );
  }
}
