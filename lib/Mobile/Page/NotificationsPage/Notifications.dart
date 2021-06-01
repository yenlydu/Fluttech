import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Model/Constants/C_Notifications.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key key}) : super(key: key);
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Notifications Template
  @override
  Widget _buildNotificationsTemplate(Text str) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            child: Column(
              children: <Widget>[
                Text(
                  str.data,
                  style: kNotifStyle,
                ),
              ],
            ),
          ),
          sizeBox_Spacing(10),
        ],
      ),
    );
  }

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
            padding:
                new EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _buildNotificationsTemplate(Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a")),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
