import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
//File Page Includ
import 'package:flutter2/Model/FireStoreModel/UserModel.dart';
import 'package:flutter2/Mobile/Tools/authentication_service.dart';
import 'package:flutter2/Mobile/Page/Homepage/Nav.dart';
import 'package:flutter2/Mobile/Page/Homepage/Selection.dart';
import 'package:flutter2/Web/homeAdmin.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/LocalTools.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Web/Login.dart';

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
            debugShowCheckedModeBanner: false,
            title: 'FluTECH',
            theme: ThemeData(
              fontFamily: 'Montserrat',
              primarySwatch: Colors.deepPurple,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            routes: <String, WidgetBuilder>{
              '/login': (BuildContext context) => new LoginP(),
              '/home': (BuildContext context) => new NavElem(),
            },
            home: AuthenticationWrapper(),
          ),
        ),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  Future<UserModel> getfirestoreuser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null && firebaseUser.uid != null) {
      var res = await locator<FireStoreUser>().getUser(firebaseUser.uid);
      if (res != null) {
        locator<FireStoreUser>().currentUser = res;
      }
      return res;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return (FutureBuilder(
        future: getfirestoreuser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else {
                final firebaseUser = FirebaseAuth.instance.currentUser;
                if (firebaseUser != null && snapshot.data != null) {
                  /*var remember = locator<LocalPreferences>().IsRememberUser();
                  if (!remember) {
                    return LoginPage();
                  }*/
                  UserModel user = snapshot.data;
                  if (user.role == "admin")
                    return HomeAdmin(email: firebaseUser.email);
                  else
                    return NavElem();
                }
                return SelectionPage();
              }
              break;

            default:
              debugPrint("Snapshot " + snapshot.toString());
              return Container(
                color: Colors.white,
                child: SpinKitFadingCube(color: Colors.deepPurple),
              ); // also check your listWidget(snapshot) as it may return null.
          }
        }));
  }
}
*/
