import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter2/main.dart';
import '../HomePage/Nav.dart';
import '../../Tools/LocalTools.dart';
import './Login.dart';
import 'package:flutter2/Model/SocialAccount.dart' as Social;

// Check if user is already log (First check with firebase & second locally)
class LoginPending extends StatefulWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  State createState() {
    return LoginPendingState();
  }
}

class LoginPendingState extends State<LoginPending> {
  BuildContext _context;

  // Finish loading Data & check if User exist and pass login page
  Future hasFinishedOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    auth.User firebaseUser = auth.FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      Social.User user = await Localtools().getCurrentUser();
      if (user != null) {

        MyMobileState.currentUser = user;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavElem()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } else {
      Social.User user = await Localtools().getCurrentUser();
      if (user != null) {
        MyMobileState.currentUser = user;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavElem()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    hasFinishedOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      backgroundColor: Color.fromRGBO(86, 0, 232, 1),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop),
            image: new AssetImage("assets/images/icon.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
