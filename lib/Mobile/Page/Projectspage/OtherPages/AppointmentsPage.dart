import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';
import '../../../../Model/Constants/C_Accordion.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({Key key}) : super(key: key);

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
                  Center(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.check, size: 18),
                      label: Text("Register"),
                    ),
                  ),
                  sizeBox_Spacing(10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Number of Students Registered: " + "10"),
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
  Widget _buildAccordionModulesTemplate(Text p_title) {
    return GFAccordion(
      titlePadding: EdgeInsets.all(0),
      titleChild: accordionHeadTemplate(p_title, kProject_Style),
      contentPadding: EdgeInsets.all(0),
      contentChild: _buildAccordionContentModulesTemplate(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                _buildAccordionModulesTemplate(
                  Text("Delivery"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
