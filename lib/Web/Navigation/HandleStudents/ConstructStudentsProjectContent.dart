import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/ProjectsActions.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';

Widget displayTitle({String title})
{
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(title, style: TextStyle(color: Color(0xFF5D1EB5),fontSize: 22,fontWeight: FontWeight.bold, ),),
  );
}

Widget singleItem({List<String> group, List<Icon> studentsPicture, ProjectInformation project})
{
  return  Padding(
    padding: EdgeInsets.only(left: 10.0),
    child: Column(
      children: [
        SizedBox(height:5),
        displayTitle(title: project.name),
        SizedBox(height:20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(child:             ActionButtonsStyle(color: Colors.red, text: "Unregister", customFunction: () => ProjectsActions(currentProject:  project,actions: ProjectActionsEnum.UNREGISTER_PROJECT_STUDENT, ), icon: Icons.app_registration,),
            ),
            SizedBox(width: 10,),

            Flexible(child:             ActionButtonsStyle(color: Colors.orange, text: "Edit group",customFunction: () => ProjectsActions(currentProject: project,actions: ProjectActionsEnum.EDIT_GROUP,), icon: Icons.group_rounded,),
            ),
            SizedBox(width: 10,),
            Flexible(child:             ActionButtonsStyle(color: Colors.orange, text: "Edit notes",customFunction: () => ProjectsActions(currentProject:  project,actions: ProjectActionsEnum.EDIT_NOTES,), icon: Icons.insert_drive_file_rounded,),
            ),
            SizedBox(width: 10,)
            //ActionButtonsStyle(color: Colors.green, text: "Add Student",customFunction: () => ProjectsActions(project: project,actions: ProjectActionsEnum.ADD_STUDENT,), icon: Icons.add,),
          ],
        ),
        SizedBox(height:5),
      ],
    ),

  );

}
