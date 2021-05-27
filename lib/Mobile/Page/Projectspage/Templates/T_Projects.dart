import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../OtherPages/DetailedPageProjects.dart';
import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';
import '../../../../Model/Constants/C_Accordion.dart';

class T_Projects extends StatelessWidget {
  T_Projects({Key key}) : super(key: key);
  BuildContext _context;

  // Accordion Content Template
  @override
  Widget _buildAccordionContentProjectsTemplate(
      Text title, Text start, Text end) {
    return InkWell(
      onTap: () {
        print("Clicked");
        Navigator.push(
          _context,
          MaterialPageRoute(
              builder: (_context) => DetailedPageProjects(
                    title: title,
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
  Widget _buildAccordionProjectsTemplate(
      Text p_title, Text p_start, Text p_end) {
    return GFAccordion(
      titlePadding: EdgeInsets.all(0),
      titleChild: accordionHeadTemplate(p_title, kProject_Style),
      contentPadding: EdgeInsets.all(0),
      contentChild: _buildAccordionContentProjectsTemplate(
          Text(p_title.data), Text(p_start.data), Text(p_end.data)),
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
                    _buildAccordionProjectsTemplate(
                      Text(
                          "M - Flutter II : Flutter & Firebase Cloud Firestore Advanced"),
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
    );
  }
}
