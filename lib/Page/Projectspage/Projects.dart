import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../Model/Constants.dart';
import '../../Model/Constants/C_Projects.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage({Key key}) : super(key: key);
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  // Projects Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
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
