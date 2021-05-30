import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreAppointements.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUnit.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/AppointementModel.dart';
import 'package:flutter2/Model/UnitModel.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';
import '../../../../Model/Constants/C_Accordion.dart';

class AppointmentsPage extends StatefulWidget {
  AppointmentsPage({Key key, this.unitinfo}) : super(key: key);

  final UnitModel unitinfo;

  @override
  AppointmentsPageState createState() => AppointmentsPageState();
}

class AppointmentsPageState extends State<AppointmentsPage> {
  // Accordion Content Template

  Future<List<AppointementModel>> appoints;
  bool _ismanager;
  bool _isuser;
  Map<int, bool> _showsub;
  Map<int, bool> _showunsub;
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.

    /*locator<FireStoreUnit>().createUnit(
        locator<FireStoreUser>().currentUser,
        "UX/UI : User Interface",
        "UI Module Skills:\n- User interface basics\n- Figma software fundamentals\n- Atomic Design \n- Design System \n- Designing for different app sections\n- Lo-fidelity vs Hi-Fidelity wireframes\n- Prototypes\n\nPresentation of the speaker:\nCarlos Gutiérrez - UX Manager at Oracle\nWith more than 9 years of experience in the world of User Experience, Carlos has worked in a range of corporate to startup companies, accumulating a significant amount of experience in the tech field at companies like Oracle and Accenture, as well as spending many years collaborating with fintech companies. Thanks to his educational background, Carlos combines the two fundamental elements of UX—psychology and design.   ",
        12,
        DateTime(2021, 1, 18),
        DateTime(2021, 4, 8),
        DateTime(2021, 6, 2));*/

    appoints = locator<FireStoreUnit>().getUnitAppointement(widget.unitinfo);
    //_controller.addListener(listener);
    super.initState();
  }

  _scrollListener() {}

  @override
  Widget _buildAccordionContentModulesTemplate(
      AppointementModel appoint, index) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: kProject_AccordionBoxDecorationStyle,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Visibility(
                      visible: _isuser,
                      child: Column(
                        children: <Widget>[
                          Visibility(
                            visible: _showsub[index],
                            child: TextButton.icon(
                              onPressed: () {
                                locator<FireStoreAppointement>()
                                    .subscribeToAppointement(appoint);
                                setState(() {
                                  _showsub[index] = !_showsub[index];
                                  _showunsub[index] = !_showunsub[index];
                                });
                              },
                              icon: Icon(Icons.check, size: 18),
                              label: Text("Register"),
                            ),
                          ),
                          Visibility(
                            visible: _showunsub[index],
                            child: TextButton.icon(
                              onPressed: () {
                                locator<FireStoreAppointement>()
                                    .unsubscribeToAppointement(appoint);
                                setState(() {
                                  _showsub[index] = !_showsub[index];
                                  _showunsub[index] = !_showunsub[index];
                                });
                              },
                              icon: Icon(Icons.cancel, size: 18),
                              label: Text("Unregister"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizeBox_Spacing(10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Number of Students Registered: " +
                        appoint.subscribedusersId.length.toString()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Accordion Head Template
  @override
  Widget _buildAccordionModulesTemplate(
      Text p_title, AppointementModel appoint, int index) {
    return GFAccordion(
      titlePadding: EdgeInsets.all(0),
      titleChild: accordionHeadTemplate(p_title, kProject_Style),
      contentPadding: EdgeInsets.all(0),
      contentChild: _buildAccordionContentModulesTemplate(appoint, index),
    );
  }

  @override
  Widget build(BuildContext context) {
    var role = locator<FireStoreUser>().currentUser.role;
    _ismanager = (role == "manager" || role == "admin") ? true : false;
    _isuser = (role == "user") ? true : false;

    return FutureBuilder(
        future: appoints,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            print("no data");
            return Scaffold(
              appBar: AppBar(
                title: Text("Appointments"),
              ),
              body: new Center(
                child: new CircularProgressIndicator(),
              ),
            );
          } else {
            print("list of data is : " +
                ((snapshot.data.length > 0)
                    ? snapshot.data[0].toString()
                    : "empty"));
            _showunsub = {};
            _showsub = {};
            return Scaffold(
              appBar: AppBar(
                title: Text("Appointments"),
              ),
              body: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                      controller: _controller, //new line
                      itemCount: snapshot.data.length,
                      shrinkWrap: true, // use this
                      itemBuilder: (BuildContext context, int index) {
                        if (snapshot.data[index] != null) {
                          AppointementModel element = snapshot.data[index];
                          _showsub[index] = element.subscribedusersId.contains(
                                  locator<FireStoreUser>().currentUser.userid)
                              ? false
                              : true;
                          _showunsub[index] = element.subscribedusersId
                                  .contains(locator<FireStoreUser>()
                                      .currentUser
                                      .userid)
                              ? true
                              : false;
                          return _buildAccordionModulesTemplate(
                              Text(element.name), element, index);
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
