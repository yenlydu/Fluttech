import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplayAllProjects.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter2/Web/CreateUser.dart';
import 'package:flutter2/Web/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
//File Page Includ
import 'package:flutter2/Mobile/Tools/authentication_service.dart';
import 'Mobile/Page/Homepage/Nav.dart';
import 'Mobile/Page/ProfilePage/Profile.dart';
import './Mobile/Page/LoginPage/login.dart';
import './Mobile/Page/Admin/LoginPage/adminLoginPage.dart';
import './Mobile/Page/LoginPage/LoginPending.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:flutter2/Web/homeAdmin.dart';

import 'Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Web/Navigation/NavigationBar.dart';
import 'package:flutter2/Web/Navigation/NavigationPages.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();
  setPathUrlStrategy();

  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OverlaySupport.global(
      child: MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
            context.read<AuthenticationService>().authStateChanges,
          )
        ],
        child: Consumer<AuthenticationService>(
          builder: (context, provider, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "FluTECH",
            theme: ThemeData(
              fontFamily: 'Montserrat',
              primarySwatch: Colors.blue,
            ),
            routes: <String, WidgetBuilder>{
              '/': (BuildContext context) => new LoginP(),
              '/my': (BuildContext context) => MyAppTest(),
              '/handleUnits': (BuildContext context) => MyAppTest(),
              '/handleUsers': (BuildContext context) => MyAppTest(),
            },
          ),
        ),
      ),
    );
  }

}


/*
class Testing extends StatefulWidget {
  @override
  // MyMobileState createState() => MyMobileState();
  //Launch web
  MyWebState createState() => MyWebState();
}

*/
class MyWebState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OverlaySupport.global(
      child: MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
            context.read<AuthenticationService>().authStateChanges,
          )
        ],
        child: Consumer<AuthenticationService>(
          builder: (context, provider, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "FluTECH",
            theme: ThemeData(
              fontFamily: 'Montserrat',
              primarySwatch: Colors.blue,
            ),
            routes: <String, WidgetBuilder>{
              '/login': (BuildContext context) => new LoginP(),
              '/handleUnits': (BuildContext context) => new AllStudents(),
            },
            home: WebAuthenticationWrapper(),
          ),
        ),
      ),
    );
  }
}

class WebAuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) firebaseUser = context.watch<User>();
    // print(["hello", firebaseUser]);
    if (firebaseUser != null) {
      // return CreateUser();
      return HomeAdmin(email: firebaseUser.email);
    }
    return LoginP();
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return NavElem();
    }
    return LoginPage();
  }
}
/*

class MyMobileState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color.fromRGBO(86, 0, 232, 1));
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: Consumer<AuthenticationService>(
        builder: (context, provider, _) => MaterialApp(
          title: 'FluTECH',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: AuthenticationWrapper(),
          routes: <String, WidgetBuilder>{
            '/login': (BuildContext context) => new LoginPage(),
            '/home': (BuildContext context) => new NavElem(),
          },
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //   ]);
  //   FlutterStatusbarcolor.setStatusBarColor(Constants().app_color);
  //   return MaterialApp(
  //     title: 'FlutTECH',
  //     theme: ThemeData(
  //       primarySwatch: Colors.deepPurple,
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //     ),
  //     home: LoginPage(),
  //     //LoginPage(),
  //     routes: <String, WidgetBuilder>{
  //       '/login': (BuildContext context) => new LoginPage(),
  //       '/home': (BuildContext context) => new NavElem(),
  //       '/admin/login': (BuildContext contect) => new AdminLoginPage(),
  //       '/admin/findUsers': (BuildContext contect) => new FindUsersPage(),
  //     },
  //   );
  // }
}
*/
