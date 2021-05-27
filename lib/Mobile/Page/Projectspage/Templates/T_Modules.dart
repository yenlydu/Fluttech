import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../OtherPages/DetailedPageModules.dart';
import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';
import '../../../../Model/Constants/C_Accordion.dart';

class T_Modules extends StatelessWidget {
  T_Modules({Key key}) : super(key: key);
  BuildContext _context;
  //TextEditingController _moduleTitleController = TextEditingController();

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
              builder: (_context) => DetailedPageModules(
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
            accordionInfoProject_Elem1(title, kProject_AccordionStyle),
            accordionInfoProject_Elem1(desc, kProject_AccordionDescStyle),
            accordionInfoProject_Elem1(Text("Available credits " + credit.data),
                kProject_AccordionDescStyle),
            accordionInfoProject_Elem1(
                Text("Between " + start.data), kProject_AccordionDescStyle),
            accordionInfoProject_Elem2(
                Text("and " + end.data), kProject_AccordionDescStyle),
            sizeBox_Spacing(15),
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
      titleChild: accordionHeadTemplate(p_title, kProject_Style),
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
    );
  }
}
