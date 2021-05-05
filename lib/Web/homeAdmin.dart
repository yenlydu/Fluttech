import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/signUpPage.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Web/Dashboard/dashboard.dart';
import 'package:flutter2/Model/Constants/C_Login.dart';

class HomeAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Dashboard(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SignUpPage(),
          )
        ],
      ),
    );
  }
}
