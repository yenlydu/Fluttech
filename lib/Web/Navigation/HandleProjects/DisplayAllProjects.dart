import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplaySingleProjectContent.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';


import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplayAllProjects.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/HandleUnits/HandleUnits.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/CreateProject/CreateProjectButton.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/DisplayHandleStudents.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:flutter2/Web/CreateUser.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/RolesDropDown/RolesDropDown.dart';

class HandleProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: HandleProjectsPage(),
    );
  }
}

class HandleProjectsPage extends StatefulWidget {
  final void customFunction;
  HandleProjectsPage({Key key, this.customFunction}) : super(key: key);
  @override
  _HandleProjectsPageState createState() => _HandleProjectsPageState();
}

class _HandleProjectsPageState extends State<HandleProjectsPage> {
  ProjectInformation firstProject = new ProjectInformation(
      name: "First project",
      teammates: [new Teammates(mail: "1@gmail", image: Icon(Icons.face, color: Colors.green,), ), new Teammates(mail: "2@gmail", image: Icon(Icons.settings, color: Colors.red,)), new Teammates(mail: "3@gmail", image: Icon(Icons.tab, color: Colors.teal,), )],
      description:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      projectStart: DateTime(2021, 09, 28, 15, 30),
      projectEnd: DateTime(2023, 09, 28, 15, 30));
  ProjectInformation secondProject = new ProjectInformation(
      name: "Second project",
      teammates: [new Teammates(mail: "21@gmail", image: Icon(Icons.face, color: Colors.green,), ), new Teammates(mail: "22@gmail", image: Icon(Icons.settings, color: Colors.red,)), new Teammates(mail: "23@gmail", image: Icon(Icons.tab, color: Colors.teal,), )],
      description:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      projectStart: DateTime(2010, 03, 12, 09, 15),
      projectEnd: DateTime(2011, 03, 12, 13, 15));
  ProjectInformation thirdProject = new ProjectInformation(
      name: "Third project",
      teammates: [new Teammates(mail: "31@gmail", image: Icon(Icons.face, color: Colors.green,), ), new Teammates(mail: "32@gmail", image: Icon(Icons.settings, color: Colors.red,)), new Teammates(mail: "33@gmail", image: Icon(Icons.tab, color: Colors.teal,), )],
      description:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      projectStart: DateTime(2010, 03, 12, 09, 15),
      projectEnd: DateTime(2011, 03, 12, 13, 15));


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: SingleChildScrollView(
            child:
            Container(
              color: Colors.transparent,
                margin: const EdgeInsets.only(top: 20.0),
                child:
                    Center(
                      child:                     Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height:25),
                          DisplayHandleProject(project: firstProject),
                          SizedBox(height:25),
                          DisplayHandleProject(project: secondProject,),
                          SizedBox(height:25),
                          DisplayHandleProject(project: thirdProject,),
                          SizedBox(height:25),
                          DisplayHandleProject(project: firstProject,),
                          SizedBox(height:25),
                          DisplayHandleProject(project: firstProject),
                          SizedBox(height:25),
                          DisplayHandleProject(project: secondProject,),
                          SizedBox(height:25),
                          DisplayHandleProject(project: thirdProject,),
                          SizedBox(height:25),
                          DisplayHandleProject(project: firstProject,),
                          SizedBox(height:25),
                          DisplayHandleProject(project: firstProject),
                          SizedBox(height:25),
                          DisplayHandleProject(project: secondProject,),
                          SizedBox(height:25),
                          DisplayHandleProject(project: thirdProject,),
                          SizedBox(height:25),
                          DisplayHandleProject(project: firstProject,),
                          SizedBox(height:25),
                          DisplayHandleProject(project: secondProject,),
                        ],
                      )

                    )
            )
        ),
    );

  }
}

class _HandleProjectsState  {

  Widget getProjectsInformation(BuildContext context) {
    //MAXIME: ICI, RECUPÉRER LES PROJETS (PAS LES UNITS) ET LES PASSER EN PARAMETRE
    return Container(
      color: Colors.white,
      child: Text("enter"),
    );

  }

  @override
  Widget build(BuildContext context) {
    return buildingScrollView(height: MediaQuery.of(context).size.height / 3/2, width: MediaQuery.of(context).size.width/1.5, context: context, child: getProjectsInformation(context));
  }
}