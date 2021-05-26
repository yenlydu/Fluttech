import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/UnitModel.dart';
import 'package:flutter2/Model/UserModel.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../Mobile/Page/Projectspage/DetailedPage.dart';
import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';

class T_Modules extends StatelessWidget {
  T_Modules({Key key}) : super(key: key);
  BuildContext _context;
  //TextEditingController _moduleTitleController = TextEditingController();

  List<Widget> unitsWidget = [];
  List<UnitModel> units = [];
  UserModel currentuser = null;
  initData() async {
    currentuser = await locator<FireStoreUser>()
        .getUser(FirebaseAuth.instance.currentUser.uid);
    units = await locator<FireStoreUser>().getUserUnits(currentuser);
    units.forEach((element) {
      unitsWidget.add(_buildAccordionModulesTemplate(
          Text(element.name),
          Text(element.description),
          Text(element.creditAvailable.toString()),
          Text(element.unitStart.toString()),
          Text(element.unitEnd.toString())));
    });
  }

  // Accordion Head Template
  @override
  Widget _buildAccordionHeadModulesTemplate(Text str) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            decoration: kProject_BoxDecorationStyle,
            child: Column(
              children: <Widget>[
                Text(
                  str.data,
                  overflow: TextOverflow.ellipsis,
                  style: kProject_Style,
                ),
                /*
                Text(
                  str.data,
                  style: kProject_Style,
                  overflow: TextOverflow.fade,
                ),*/
              ],
            ),
          ),
          sizeBox_Spacing(10),
        ],
      ),
    );
  }

  // Accordion Content Template
  @override
  Widget _buildAccordionContentModulesTemplate(
      Text title, Text desc, Text credit, Text start, Text end) {
    return InkWell(
      onTap: () {
        print("Clicked");
        Navigator.push(
          _context,
          MaterialPageRoute(
              builder: (_context) => DetailedPage(
                    title: title,
                    desc: desc,
                    credit: credit,
                    start: start,
                    end: end,
                  )),
        );
      },
      child: Container(
        decoration: kProject_AccordionBoxDecorationStyle,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Text(
                    title.data,
                    style: kProject_AccordionStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Text(
                    desc.data,
                    style: kProject_AccordionDescStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Text(
                    "Available credits " + credit.data,
                    style: kProject_AccordionDescStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Text(
                    "Between " + start.data,
                    style: kProject_AccordionDescStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Text(
                    "and " + end.data,
                    style: kProject_AccordionDescStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15),
            ),
          ],
        ),
      ),
    );
  }

  // Accordion Head Template
  @override
  Widget _buildAccordionModulesTemplate(
      Text p_title, Text p_desc, Text p_credit, Text p_start, Text p_end) {
    return GFAccordion(
      titlePadding: EdgeInsets.all(0),
      titleChild: _buildAccordionHeadModulesTemplate(Text(p_title.data)),
      contentPadding: EdgeInsets.all(0),
      contentChild: _buildAccordionContentModulesTemplate(
          Text(p_title.data),
          Text(p_desc.data),
          Text(p_credit.data),
          Text(p_start.data),
          Text(p_end.data)),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          kContainer_BGPAGES,
          ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    _buildAccordionModulesTemplate(
                      Text(
                          "M - Flutter II : Flutter & Firebase Cloud Firestore Advanced"),
                      Text(
                          "Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.\nOrganizations around the world are building apps with Flutter.\nFlutter Advantages: Fast Development, Expressive and Flexible UI, Native Performance\nFirebase: Helps You Build, Improve, & Grow Your Mobile Apps. Check It Out Today! Find All The Docs You Need To Get Started With Firebase In Minutes. Learn More! Automatic & secure login. Custom Domain Support. Build Fast For Any Device. "),
                      Text("12"),
                      Text("14/04/2021, 00h00"),
                      Text("02/06/2021, 00h00"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Module"),
            content: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Text("Enter Module Title"),
                  TextFormField(),
                  sizeBox_Spacing(30),
                  Text("Enter Module Description"),
                  TextFormField(),
                  sizeBox_Spacing(30),
                  Text("Enter Module Credits"),
                  TextFormField(),
                  sizeBox_Spacing(30),
                  Text("Enter Module Start Date"),
                  TextFormField(),
                  sizeBox_Spacing(30),
                  Text("Enter Module End Date"),
                  TextFormField(),
                ],
              ),
            ), //Text("Enter Module Title"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
