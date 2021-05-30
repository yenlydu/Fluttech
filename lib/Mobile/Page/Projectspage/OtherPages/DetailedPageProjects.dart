import 'package:flutter/material.dart';
import 'package:flutter2/Model/ProjectModel.dart';
import 'package:getwidget/getwidget.dart';

import '../OtherPages/AppointmentsPage.dart';
import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';
import '../../../../Model/Constants/C_Accordion.dart';
import '../../../../Model/Constants/C_DetailedPage.dart';

class DetailedPageProjects extends StatelessWidget {
  DetailedPageProjects(
      {Key key, this.title, this.start, this.end, this.projectinfo})
      : super(key: key);
  BuildContext _context;
  final Text title;
  final Text start;
  final Text end;
  final ProjectModel projectinfo;

  // Accordion Content Template
  @override
  Widget _buildAccordionContentModulesTemplate() {
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
                  studentName(Text("Dylan Ferreira")), //Student Name Template
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
  Widget _buildAccordionDPProjectsTemplate(Text p_title) {
    return GFAccordion(
      titlePadding: EdgeInsets.all(0),
      titleChild: accordionHeadTemplate(p_title, kProject_Style), // group name
      contentPadding: EdgeInsets.all(0),
      contentChild: _buildAccordionContentModulesTemplate(), // list of students
    );
  }

  Widget _groupButtons() {
    return Table(
      children: [
        TableRow(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.people, size: 18),
              label: Text("Create Group"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add, size: 18),
              label: Text("Add a Member"),
            ),
          ],
        )
      ],
    );
  }

  Widget _groupList() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            width: double.infinity,
            color: Color(0xFF664C9E),
            child: Text(
              "List of Groups",
              style: textStyle_DetailedPage,
            ),
          ),
          _buildAccordionDPProjectsTemplate(Text("flutter")),
          _buildAccordionDPProjectsTemplate(Text("fvbdfb")),
          _buildAccordionDPProjectsTemplate(Text("zf")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(title.data),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                textDPboth_title(title, textStyle_Title),
                sizeBox_Spacing(10),
                separator(5),
                sizeBox_Spacing(25),
                textDP_elem2(Text("Between " + start.data), textStyle_Date),
                textDP_elem2(Text("and " + end.data), textStyle_Date),
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
