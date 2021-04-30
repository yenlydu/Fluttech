import 'package:flutter/material.dart';
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
          Container(
            width: 180,
            child: Column(
              children: <Widget> [
                Dashboard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}