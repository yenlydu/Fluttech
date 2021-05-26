import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/UnitModel.dart';
import 'package:flutter2/Model/UserModel.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';

class T_Modules extends StatelessWidget {
  T_Modules({Key key}) : super(key: key);

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
          kSizeBox_Space10,
        ],
      ),
    );
  }

  // Accordion Content Template
  @override
  Widget _buildAccordionContentModulesTemplate(
      Text title, Text desc, Text credit, Text start, Text end) {
    return Container(
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
    initData();
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: unitsWidget,
          ),
        )
      ],
    );
  }
}
