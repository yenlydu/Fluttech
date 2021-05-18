import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../Model/Constants.dart';
import '../../../Model/Constants/C_Projects.dart';

class T_Modules extends StatelessWidget {
  const T_Modules({Key key}) : super(key: key);

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
  Widget _test() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        )
      ],
    );
  }
}
