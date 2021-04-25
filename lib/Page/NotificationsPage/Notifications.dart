import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../Model/Constants.dart';
import '../../Model/Constants/C_Notifications.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key key}) : super(key: key);
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Notifications Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
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
