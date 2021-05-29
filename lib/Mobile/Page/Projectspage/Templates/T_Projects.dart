import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/ProjectModel.dart';
import 'package:flutter2/Model/UserModel.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../Mobile/Page/Projectspage/DetailedPage.dart';
import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';

class T_Projects extends StatelessWidget {
  T_Projects({Key key}) : super(key: key);
  BuildContext _context;

  List<Widget> unitsWidget = [];
  List<ProjectModel> units = [];
  UserModel currentuser = null;

  Future<List<Widget>> initData() async {
    currentuser = await locator<FireStoreUser>().currentUser;
    units = await locator<FireStoreUser>().getUserProjects(currentuser);
    units.forEach((element) {
      unitsWidget.add(_buildAccordionProjectsTemplate(
          Text(element.name),
          Text(element.unitid),
          Text(element.name),
          Text(element.projectstart.toString()),
          Text(element.projectEnd.toString())));
    });
    return unitsWidget;
  }

  // Accordion Head Template
  @override
  Widget _buildAccordionHeadProjectsTemplate(Text str) {
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
  Widget _buildAccordionContentProjectsTemplate(
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
  Widget _buildAccordionProjectsTemplate(
      Text p_title, Text p_desc, Text p_credit, Text p_start, Text p_end) {
    return GFAccordion(
      titlePadding: EdgeInsets.all(0),
      titleChild: _buildAccordionHeadProjectsTemplate(Text(p_title.data)),
      contentPadding: EdgeInsets.all(0),
      contentChild: _buildAccordionContentProjectsTemplate(
          Text(p_title.data),
          Text(p_desc.data),
          Text(p_credit.data),
          Text(p_start.data),
          Text(p_end.data)),
    );
  }

  @override
  Widget _test() {
    return Container();
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
                    _buildAccordionProjectsTemplate(
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
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Project"),
            content: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Text("Enter Project Title"),
                  TextFormField(),
                  sizeBox_Spacing(30),
                  Text("Enter Project Description"),
                  TextFormField(),
                  sizeBox_Spacing(30),
                  Text("Enter Project Credits"),
                  TextFormField(),
                  sizeBox_Spacing(30),
                  Text("Enter Project Start Date"),
                  TextFormField(),
                  sizeBox_Spacing(30),
                  Text("Enter Project End Date"),
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
