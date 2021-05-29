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

class T_Modules extends StatefulWidget {
  T_Modules({Key key}) : super(key: key);
  @override
  _T_ModulesState createState() => _T_ModulesState();
}

class _T_ModulesState extends State<T_Modules> {
  BuildContext _context;
  //TextEditingController _moduleTitleController = TextEditingController();

  Future<List<UnitModel>> units;
  UserModel currentuser = null;
  bool _isadmin;
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
    units = locator<FireStoreUser>()
        .getUserUnits(locator<FireStoreUser>().currentUser);
    //_controller.addListener(listener);
    super.initState();
  }

  _scrollListener() {}

  // Accordion Head Template
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
  Widget _buildAccordionContentModulesTemplate(Text title, Text desc,
      Text credit, Text start, Text end, UnitModel unit) {
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
                    unitinfo: unit,
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
  Widget _buildAccordionModulesTemplate(Text p_title, Text p_desc,
      Text p_credit, Text p_start, Text p_end, UnitModel unit) {
    return GFAccordion(
      titlePadding: EdgeInsets.all(0),
      titleChild: _buildAccordionHeadModulesTemplate(Text(p_title.data)),
      contentPadding: EdgeInsets.all(0),
      contentChild: _buildAccordionContentModulesTemplate(
          Text(p_title.data),
          Text(p_desc.data),
          Text(p_credit.data),
          Text(p_start.data),
          Text(p_end.data),
          unit),
    );
  }

  //FAB Template

  @override
  Widget _buildFloatingActionButtonModulesTemplate(BuildContext context) {
    return FloatingActionButton(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return FutureBuilder(
        future: units,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            print("no data");
            return new Center(
              child: new CircularProgressIndicator(),
            );
          } else {
            print("list of data is : " +
                ((snapshot.data.length > 0)
                    ? snapshot.data[0].toString()
                    : "empty"));
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  kContainer_BGPAGES,
                  ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                          controller: _controller, //new line
                          itemCount: snapshot.data.length,
                          shrinkWrap: true, // use this
                          itemBuilder: (BuildContext context, int index) {
                            if (snapshot.data[index] != null) {
                              UnitModel element = snapshot.data[index];
                              return _buildAccordionModulesTemplate(
                                  Text(element.name),
                                  Text(element.description),
                                  Text(element.creditAvailable.toString()),
                                  Text(element.unitStart.toString()),
                                  Text(element.unitEnd.toString()),
                                  element);
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        });
  }
}
