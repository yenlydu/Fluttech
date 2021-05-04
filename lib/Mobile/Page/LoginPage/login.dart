import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Page/Admin/LoginPage/adminLoginPage.dart';
import 'package:flutter2/Mobile/Page/CommonBackground.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

//File Page Includ
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Model/Constants/C_Login.dart';
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
/*
  // Show Message in case of error (Not Use)
  Future<void> _showMessage(String message) {
    return showDialog<void>(
      context: _context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
*/

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
        kSizeBox_Space10,
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            controller: emailController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: Colors.white),
              hintText: "Enter your Email",
              hintStyle: kHintTextStyle,
            ),
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
        kSizeBox_Space10,
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            controller: passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.lock, color: Colors.white),
              hintText: "Enter your Password",
              hintStyle: kHintTextStyle,
            ),
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
        onPressed: () {
          context.read<AuthenticationService>().signIn(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
        },
        // onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget _buildStructure() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Log In",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        kSizeBox_Space30,
        _buildEmailTF(),
        kSizeBox_Space30,
        _buildPasswordTF(),
        _buildForgotPasswordBT(),
        _buildRememberMeCheckBox(),
        _buildLoginBtn(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
    );
  }
}

/* OLD PAGE
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: Column(
        children: <Widget>[
          //Main Icon
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.85,
              child: Container(
                color: Color.fromRGBO(86, 0, 232, 1),
                child:
                    Image.asset('assets/images/icon.png', fit: BoxFit.contain),
              ),
            ),
          ),
          Container(
            child: Text("Hello on the login Page"),
            height: 40,
          ),
        ],
      ),
    );
  }*/

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
