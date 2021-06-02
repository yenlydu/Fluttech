import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUnit.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/FireStoreModel/ProjectModel.dart';
import 'package:flutter2/Model/FireStoreModel/UnitModel.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';
import '../../../../Model/Constants/C_Accordion.dart';
import 'DetailedPageProjects.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage({Key key, this.unitinfo}) : super(key: key);

  final UnitModel unitinfo;

  @override
  ProjectsPageState createState() => ProjectsPageState();
}

class ProjectsPageState extends State<ProjectsPage> {
  // Accordion Content Template
  BuildContext _context;

  Future<List<ProjectModel>> projects;
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.

    projects = locator<FireStoreUnit>().getUnitProject(widget.unitinfo);
    super.initState();
  }

  _scrollListener() {}

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
      Text title, Text start, Text end, ProjectModel project) {
    return InkWell(
      onTap: () {
        print("Clicked");
        Navigator.push(
          _context,
          MaterialPageRoute(
              builder: (_context) => DetailedPageProjects(
                    projectinfo: project,
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
      Text p_title, ProjectModel project, int index) {
    return GFAccordion(
      titlePadding: EdgeInsets.all(0),
      titleChild: accordionHeadTemplate(p_title, kProject_Style),
      contentPadding: EdgeInsets.all(0),
      contentChild: _buildAccordionContentProjectsTemplate(
          Text(p_title.data),
          Text(project.projectStart.toString()),
          Text(project.projectEnd.toString()),
          project),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return FutureBuilder(
        future: projects,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Projects"),
              ),
              body: new Center(
                child: new CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text("Projects"),
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
                          ProjectModel element = snapshot.data[index];
                          return _buildAccordionProjectsTemplate(
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
