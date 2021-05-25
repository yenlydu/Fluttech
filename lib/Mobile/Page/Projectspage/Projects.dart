import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter2/Mobile/Page/CalendarPage/Calendar.dart';
import 'package:flutter2/Mobile/Page/NotificationsPage/Notifications.dart';
import 'package:flutter2/Mobile/Page/ProjectsPage/Templates/T_Modules.dart';
import 'package:flutter2/Mobile/Page/ProjectsPage/Templates/T_Projects.dart';

import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Model/Constants/C_Projects.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage({Key key}) : super(key: key);
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget _buildStructure() {
    return Expanded(
      child: Container(
        child: DefaultTabController(
          length: 2, // length of tabs
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: TabBar(
                  labelColor: Constants().login_app_color,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'Projects'.toUpperCase()),
                    Tab(text: 'Modules'.toUpperCase()),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    T_Projects(),
                    T_Modules(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Projects Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _buildStructure(),
          ],
        ),
      ),
    );
  }
}
