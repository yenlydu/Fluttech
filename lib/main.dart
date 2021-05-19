import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter2/Web/CreateUser.dart';
import 'package:flutter2/Web/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:overlay_support/overlay_support.dart';

//File Page Includ
import 'package:flutter2/Mobile/Tools/authentication_service.dart';
import 'Mobile/Page/ProfilePage/Profile.dart';
import './Mobile/Page/LoginPage/login.dart';
import 'package:flutter2/Model/SocialAccount.dart' as localuser;
import 'package:flutter2/Web/homeAdmin.dart';

Future<void> main() async {
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

class MyWebState extends State<MyApp> {
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
      return ProfilePage();
    }
    return LoginPage();
  }
}

class MyMobileState extends State<MyApp> with WidgetsBindingObserver {
  static localuser.User currentUser;
  @override
  Widget build(BuildContext context) {
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
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: AuthenticationWrapper(),
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
