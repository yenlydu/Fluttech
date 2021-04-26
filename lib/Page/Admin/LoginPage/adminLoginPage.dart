import 'package:flutter/material.dart';
import 'package:flutter2/Page/LoginPage/login.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../../../Model/Constants.dart';
import '../../../Model/Constants/C_Login.dart';
import '../../CommonBackground.dart';

class AdminLoginPage extends StatefulWidget {
  AdminLoginPage();

  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();

}
class _AdminLoginPageState extends State<AdminLoginPage> {
  final emailTFController = TextEditingController();
  final passwordTFController = TextEditingController();

  bool _rememberme = false;
  // LOGIN BUTTONS

  Widget buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            controller: passwordTFController,
            obscureText: true,
            style: TextStyle(color: Colors.white),
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
  bool checkEmailPasswordCorrect(){
    print(emailTFController.text.isEmpty);
    if (emailTFController.text.isNotEmpty && passwordTFController.text.isNotEmpty) {
      return  true;
    }
    return false;
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            controller: emailTFController,

            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
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




  Widget _buildLoginBtn() {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () =>
        {
          if (checkEmailPasswordCorrect() == false)
            Constants().errorFieldAlert(context)
          else
            Navigator.pushNamed(context, '/admin/findUsers')

      },
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
  Widget _buildForgotPasswordBT() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () =>
        {
    //      Navigator.push(
      //      context,
        //    PageRouteBuilder(pageBuilder: (_, __, ___) => AdminLoginPage()),
          //)
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          "Forgot Password ?",
          style: kLabelStyle,
        ),
      ),
    );
  }
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,   //new line

      body: Stack(


        children: <Widget> [
          CommonBackground(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Column(

              children:<Widget> [
                Text(
                  "ADMIN Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    letterSpacing: 1.5,

                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),

                this._buildEmailTF(),
                SizedBox(
                  height: 30.0,
                ),
                this.buildPasswordField(),
                _buildForgotPasswordBT(),
                SizedBox(
                  height: 30.0,
                ),
                _buildRememberMeCheckBox(),
                this._buildLoginBtn(),
                Constants().buttonChangeUserPage("CLASSIC LOGIN", PageRouteBuilder(pageBuilder: (_, __, ___) => LoginPage()), context),
                //this.buttonChangeUserPage("Non admin log in", PageRouteBuilder(pageBuilder: (_, __, ___) => LoginPage()), context),
              ],
            ),
          ),
        ],
      ),


    );

  }
}