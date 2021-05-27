import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/PopupDescription.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/ProjectsActions.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/CreateProject/CreateProjectPopup.dart';

class DisplayHandleUnits extends StatefulWidget {
  final ProjectInformation project;
  final String unitsId;

  DisplayHandleUnits({this.project, this.unitsId});

  @override
  _DisplayHandleUnitsState createState() => _DisplayHandleUnitsState();
}

class  _DisplayHandleUnitsState extends State<DisplayHandleUnits>
{
  Widget displayTitle({String title})
  {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: TextStyle(color: Color(0xFF5D1EB5),fontSize: 22,fontWeight: FontWeight.bold, ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildingSingleItemConstant(context: context, itemDisplay: item(widget.project), onTapPopup: PopupDescription(project: widget.project), firebaseModuleId:  widget.unitsId);
  }

  void setProjectEdited(ProjectInformation pr)
  {
    setState(() {
//      widget.project = pr;
    });
  }

  List mailAddressesList = [
    "teacher1@epitech.eu",
    "teacher2@epitech.eu",
    "teacr2@epitech.eu",
    "azdef@epitech.eu",
    "prof@epitech.eu",
  ];

  Widget item(ProjectInformation project)
  {
    return Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          SizedBox(height:5),
          displayTitle(title: project.title),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionButtonsStyle(color: Colors.red, text: "Delete", customFunction: () => ProjectsActions(currrentProject: project,actions: ProjectActionsEnum.DELETE, ), icon: Icons.delete),
              ActionButtonsStyle(color: Colors.orange, text: "Edit",customFunction: () => ProjectsActions(currrentProject: project,actions: ProjectActionsEnum.EDIT_UNIT,), icon: Icons.edit),
              ActionButtonsStyle(color: Colors.lightGreen, text: "Create Project",customFunction: () => CreateProjectPopup(createType: ProjectActionsEnum.CREATE_PROJECT,mailAddressesList: mailAddressesList, ), icon: Icons.add,),
            ],
          ),
          SizedBox(height:5),
        ],
      ),
    );
  }
}

