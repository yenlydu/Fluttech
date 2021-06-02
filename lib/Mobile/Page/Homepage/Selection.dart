import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Page/LoginPage/login.dart';

import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Web/Login.dart';

class SelectionPage extends StatefulWidget {
  SelectionPage({Key key}) : super(key: key);
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
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
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          )
                        },
                        child: selection_Button(Text("Student or Manager")),
                      ),
                      sizeBox_Spacing(20),
                      TextButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginP()),
                          )
                        },
                        child: selection_Button(Text("Administrator")),
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
