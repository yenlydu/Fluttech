import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Page/Admin/LoginPage/adminLoginPage.dart';
import 'package:flutter2/Mobile/Page/CommonBackground.dart';
import 'package:flutter2/Mobile/Page/Homepage/Nav.dart';
import 'package:flutter2/Mobile/Page/Homepage/home.dart';
import 'package:flutter2/Mobile/Page/ProfilePage/Profile.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/UserModel.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//File Page Includ
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Model/Constants/C_Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widget/app_icons_icons.dart';
import '../../Tools/authentication_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _rememberme = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _visible = false;
  bool _loginvisible = false;

  _LoginPageState() {
    Timer _timer;
    _timer = new Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _visible = !_visible;
      });
    });
  }

  @override
  Widget _buildRememberMeCheckBox() {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberme,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberme = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  @override
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: kLabelStyle,
        ),
        sizeBox_Spacing(10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            controller: emailController,
            decoration: kInputDeco_email,
          ),
        ),
      ],
    );
  }

  @override
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: kLabelStyle,
        ),
        sizeBox_Spacing(10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            controller: passwordController,
            decoration: kInputDeco_pwd,
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBT() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => {
          Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (_, __, ___) => AdminLoginPage()),
          )
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          "Forgot Password ?",
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          setState(() {
            _loginvisible = !_loginvisible;
          });
          String res = await context.read<AuthenticationService>().signIn(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
          if (res == "Signed in") {
            var user =
                await context.read<AuthenticationService>().getUserInfo();
            UserModel newuser = UserModel();
            newuser.email = user.email;
            newuser.firebaseid = user.uid;
            newuser.firstName = user.email;
            newuser.phoneNumber = user.phoneNumber;
            locator<FireStoreUser>().registerUser(user, newuser);
            locator<FireStoreUser>().currentUser = newuser;
            if (_rememberme == true) {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool("rememberme", true);
            }

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => NavElem()));
          }

          setState(() {
            _loginvisible = !_loginvisible;
          });
        },
        // onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: login_Button(),
      ),
    );
  }

  @override
  Widget _buildStructure() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        login_Title(),
        sizeBox_Spacing(30),
        _buildEmailTF(),
        sizeBox_Spacing(30),
        _buildPasswordTF(),
        _buildForgotPasswordBT(),
        _buildRememberMeCheckBox(),
        _buildLoginBtn(),
        const SizedBox(height: 48.0),
        AnimatedOpacity(
          opacity: _loginvisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: const SpinKitFadingCube(color: Colors.deepPurple),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedOpacity(
      // If the widget is visible, animate to 0.0 (invisible).
      // If the widget is hidden, animate to 1.0 (fully visible).

      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      // The green box must be a child of the AnimatedOpacity widget.
      child: Stack(
        children: <Widget>[
          kContainer_BG,
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: _buildStructure(),
            ),
          ),
        ],
      ),
    ));
  }
}

/* HOME PAGE

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          kContainer_BG,
          Align(
            alignment: Alignment.center,
            child: new Image.asset(
              'assets/images/icon.png',
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
  */
