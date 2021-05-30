import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUnit.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/ProjectModel.dart';
import 'package:flutter2/Model/UnitModel.dart';
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

    projects = locator<FireStoreUnit>().getUnitProject(widget.unitinfo);
    //_controller.addListener(listener);
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
                    title: title,
                    start: start,
                    end: end,
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
          Text(project.projectstart.toString()),
          Text(project.projectEnd.toString()),
          project),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    var role = locator<FireStoreUser>().currentUser.role;
    _ismanager = (role == "manager" || role == "admin") ? true : false;
    _isuser = (role == "user") ? true : false;

    return FutureBuilder(
        future: projects,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            print("no data");
            return Scaffold(
              appBar: AppBar(
                title: Text("Projects"),
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
