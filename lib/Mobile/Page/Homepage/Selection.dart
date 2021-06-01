import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Page/ProjectsPage/Templates/T_Modules.dart';
import 'package:flutter2/Mobile/Page/ProjectsPage/Templates/T_Projects.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';

import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Model/UserModel.dart';

class SelectionPage extends StatefulWidget {
  SelectionPage({Key key}) : super(key: key);
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<SelectionPage> {
  // Selection Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          kContainer_BG,
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 240.0,
              ),
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text("Connect as", style: textStyle_Selection_Title),
                      sizeBox_Spacing(20),
                      TextButton(
                        onPressed: () => {},
                        child: selection_Button(Text("User")),
                      ),
                      sizeBox_Spacing(5),
                      TextButton(
                        onPressed: () => {},
                        child: selection_Button(Text("Manager")),
                      ),
                    ],
                  ),
                ),
              ),
              //child: _buildStructure(),
            ),
          ),
        ],
      ),
    );
  }
}

/*

           */
/*
          Container(
            //height: double.infinity,
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("Connect as", style: textStyle_Title),
                    TextButton(onPressed: () => {}, child: Text("User")),
                    TextButton(onPressed: () => {}, child: Text("Manager")),
                  ],
                ),
              ),
            ),
          ), */
