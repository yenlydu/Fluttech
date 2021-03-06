import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Page/ProjectsPage/Templates/T_Modules.dart';
import 'package:flutter2/Mobile/Page/ProjectsPage/Templates/T_Projects.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';

import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Model/FireStoreModel/UserModel.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage({Key key}) : super(key: key);
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  UserModel currentuser;

  _initData(BuildContext context) {
    locator<FireStoreUser>().currentUser;
  }

  @override
  Widget _buildStructure() {
    _initData(context);
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
