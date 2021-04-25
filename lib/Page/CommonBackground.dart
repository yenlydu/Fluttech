import 'package:flutter/material.dart';
import '../../Model/Constants.dart';

class CommonBackground extends StatefulWidget {
  @override
  _CommonBackground createState() => _CommonBackground();
}

class _CommonBackground extends State<CommonBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kBoxDecoration_BG,
      ),
    );
  }
}