import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter2/Web/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:overlay_support/overlay_support.dart';

//File Page Includ
import 'package:flutter2/Mobile/Tools/authentication_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Mobile/Page/Homepage/Nav.dart';
import './Mobile/Page/LoginPage/login.dart';

import 'package:flutter2/Web/homeAdmin.dart';

import 'Mobile/Tools/FireStore/FireStoreUser.dart';
import 'Mobile/Tools/LocalTools.dart';
import 'Mobile/Tools/ServiceLocator/ServiceManager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();
  await locator<LocalPreferences>().init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyMobileState createState() => MyMobileState();
  //Launch web
  //MyWebState createState() => MyWebState();
}

class MyWebState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
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
      var remember = locator<LocalPreferences>().IsRememberUser();
      if (!remember) {
        return LoginPage();
      }
      var res = locator<FireStoreUser>().getUser(firebaseUser.uid);
      res.then((value) => {
            if (value != null) {locator<FireStoreUser>().currentUser = value}
          });
      return NavElem();
    }
    return LoginPage();
  }
}

class MyMobileState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    FlutterStatusbarcolor.setStatusBarColor(Color.fromRGBO(86, 0, 232, 1));
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
