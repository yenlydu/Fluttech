import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter2/Mobile/Tools/push_notifications.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter2/Web/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

//File Page Includ
import 'package:flutter2/Mobile/Tools/authentication_service.dart';
import 'Mobile/Page/Homepage/Nav.dart';
import 'Mobile/Page/ProfilePage/Profile.dart';
import './Mobile/Page/LoginPage/login.dart';

import 'package:flutter2/Web/homeAdmin.dart';
// import './mobile/Tools/authentication_service.dart';

// import './Mobile/Page/home_page.dart';
import 'Mobile/Tools/ServiceLocator/ServiceManager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServices();
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
    // TODO: implement build

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
          title: "FluTECH",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: WebAuthenticationWrapper(),
        ),
      ),
    );
  }
}

class WebAuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeAdmin();
    }
    return LoginP();
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final firebaseUser = context.watch<User>();
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return NavElem();
    }
    return LoginPage();
  }
}

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
