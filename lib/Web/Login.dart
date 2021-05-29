import 'package:flutter/material.dart';
import 'package:flutter2/Web/homeAdmin.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../Mobile/Tools/authentication_service.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter2/Web/routes.dart';
import 'package:flutter2/Web/navigationbar.dart';
import 'package:flutter_modular/flutter_modular.dart';
class FirebaseAutb extends StatelessWidget {
  const FirebaseAutb({Key key}) : super(key: key);

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

class LoginP extends StatefulWidget {
  @override
  _LoginPState createState() => _LoginPState();

}

class _LoginPState extends State<LoginP> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    // FirebaseAuth auth = FirebaseAuth.instance;
    final TextEditingController password = TextEditingController();
    final TextEditingController email = TextEditingController();

    return Container(
      decoration: kBoxDecoration_BG,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 3), blurRadius: 24)
                ],
              ),
              height: 450,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: new AssetImage("assets/images/icon.png"),
                    color: null,
                    width: 150,
                    height: 150,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                  ),
                  Text(
                    "ADMINISTRATOR",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Butler"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              icon: Icon(Icons.email_outlined)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              icon: Icon(Icons.lock_open)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("Forgot password?")],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                      ),
                      child: FlatButton(
                        onPressed: ()=> {
/*                          context.read<AuthenticationService>().signIn(
                            context: context,
                          email: email.text.trim(),
                          password: password.text.trim(),
                          ),*/
                        Navigator.pushNamed(context, "/my")
                      },
                          child: Text("Sign in",
                              style: TextStyle(color: Colors.white)),

/*                            // TEXT FOR INVALID LOGIN
                        onPressed:() {
                          if (email.text.isEmpty || password.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email or password")));
                          } else {
                            print(email.text + " "+ password.text);
                            Navigator.push(context,     MaterialPageRoute(
                              builder: (context) => HomeAdmin (email: email.text,)
                            ));
                            //                            Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => FindUsersPage()));
                          }
                        },*/
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppTest extends StatefulWidget {
@override
  MyAppState createState() => MyAppState();

}
class MyAppState extends State<MyAppTest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FluTECH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (_, child) => AppView(
        child: child,
      ),
      initialRoute: routeUnits,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {

  final Widget child;

  const AppView({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [NavigationBarWeb(), Expanded(child: child)],
      ),
    );
  }
}
