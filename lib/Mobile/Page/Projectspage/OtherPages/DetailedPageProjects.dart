import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreProject.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUnit.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/Group.dart';
import 'package:flutter2/Model/UnitModel.dart';
import 'package:flutter2/Model/UserModel.dart';
import 'package:intl/intl.dart';
import 'package:flutter2/Model/ProjectModel.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';
import '../../../../Model/Constants/C_Accordion.dart';
import '../../../../Model/Constants/C_DetailedPage.dart';

class DetailedPageProjects extends StatefulWidget {
  DetailedPageProjects({Key key, this.projectinfo}) : super(key: key);

  final ProjectModel projectinfo;

  @override
  DetailedPageProjectsState createState() => DetailedPageProjectsState();
}

class DetailedPageProjectsState extends State<DetailedPageProjects> {
  BuildContext _context;

  Future<List<UserModel>> usersFuture;
  List<UserModel> users;
  String title = '';
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();

  bool _ismanager;
  bool _isuser;
  bool _showsub;
  bool _showunsub;

  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.

    usersFuture =
        locator<FireStoreProject>().getProjectUsers(widget.projectinfo);
    usersFuture.then((value) {
      users = value;
    });
    super.initState();
  }

  _scrollListener() {}

  // Accordion Content Template
  /*@override
  Widget _buildAccordionContentModulesTemplate() {
    return FutureBuilder(
        future: usersFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return new Center();
          } else {
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: kProject_AccordionBoxDecorationStyle,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }

  // Accordion Head Template
  @override
  Widget _buildAccordionDPProjectsTemplate(Group group) {
    return GFAccordion(
      titlePadding: EdgeInsets.all(0),
      titleChild: accordionHeadTemplate(
          Text(group.group_name), kProject_Style), // group name
      contentPadding: EdgeInsets.all(0),
      contentChild: _buildAccordionContentModulesTemplate(), // list of students
    );
  }*/

  Widget _groupButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          Visibility(
            visible: _isuser,
            child: Column(
              children: <Widget>[
                Visibility(
                  visible: _showsub,
                  child: TextButton.icon(
                    onPressed: () {
                      locator<FireStoreProject>()
                          .subscribeToProject(widget.projectinfo);
                      setState(() {
                        _showsub = !_showsub;
                        _showunsub = !_showunsub;
                        usersFuture = locator<FireStoreProject>()
                            .getProjectUsers(widget.projectinfo);
                      });
                    },
                    icon: Icon(Icons.check, size: 18),
                    label: Text("Register"),
                  ),
                ),
                Visibility(
                  visible: _showunsub,
                  child: TextButton.icon(
                    onPressed: () {
                      locator<FireStoreProject>()
                          .unsubscribeToProject(widget.projectinfo);
                      setState(() {
                        _showsub = !_showsub;
                        _showunsub = !_showunsub;
                        usersFuture = locator<FireStoreProject>()
                            .getProjectUsers(widget.projectinfo);
                      });
                    },
                    icon: Icon(Icons.cancel, size: 18),
                    label: Text("Unregister"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _groupList() {
    return FutureBuilder(
        future: usersFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    width: double.infinity,
                    color: Color(0xFF664C9E),
                    child: Text(
                      "List of Users",
                      style: textStyle_DetailedPage,
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: ListView.builder(
                            controller: _controller, //new line
                            itemCount: snapshot.data.length,
                            shrinkWrap: true, // use this
                            itemBuilder: (BuildContext context, int index) {
                              if (snapshot.data[index] != null) {
                                UserModel element = snapshot.data[index];
                                return studentName(
                                    element.firebaseid, element.email);
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    var role = locator<FireStoreUser>().currentUser.role;
    print("role is : " + role);
    setState(() {
      _ismanager = (role == "manager" || role == "admin") ? true : false;
      _isuser = (role == "user") ? true : false;
      _showsub = widget.projectinfo.usersId
              .contains(locator<FireStoreUser>().currentUser.firebaseid)
          ? false
          : true;
      _showunsub = widget.projectinfo.usersId
              .contains(locator<FireStoreUser>().currentUser.firebaseid)
          ? true
          : false;
    });
    title = widget.projectinfo.name;
    start = widget.projectinfo.projectstart;
    end = widget.projectinfo.projectEnd;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                textDPboth_title(Text(title), textStyle_Title),
                sizeBox_Spacing(10),
                separator(5),
                sizeBox_Spacing(25),
                textDP_elem2(
                    Text("Between " + DateFormat('yyyy-MM-dd').format(start)),
                    textStyle_Date),
                textDP_elem2(
                    Text("and " + DateFormat('yyyy-MM-dd').format(end)),
                    textStyle_Date),
                sizeBox_Spacing(25),
                _groupList(),
                sizeBox_Spacing(25),
                _groupButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
