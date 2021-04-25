import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../Model/Constants.dart';
import '../../Model/Constants/C_Calendar.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key}) : super(key: key);
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // Calendar Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: new EdgeInsets.only(top: 25),
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
