import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';

Widget dismissDeletePopup(BuildContext context)
{
  Navigator.of(context).pop();
  Navigator.pop(context);
  return Container();
}

Widget deleteProject({ProjectInformation project, BuildContext context})
{
  return AlertDialog(
    content:Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Are you sure you want to delete the project : " + project.title + "?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
        SizedBox(height: 20),
        ActionButtonsStyle(color: Colors.red, text: "Delete Project", customFunction: () => dismissDeletePopup(context), icon: Icons.delete),
      ],
    ),
  );

}

Widget deleteUnit({ProjectInformation project, BuildContext context})
{
  return AlertDialog(
    content:Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Are you sure you want to delete the unit : " + project.title + "?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
        SizedBox(height: 20),
        ActionButtonsStyle(color: Colors.red, text: "Delete Unit", customFunction: () => dismissDeletePopup(context), icon: Icons.delete),
      ],
    ),
  );

}

Widget unregister({ProjectInformation project, BuildContext context})
{
  return AlertDialog(
    content:Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Are you sure you want to unregister the student from : " + project.title + "?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
        SizedBox(height: 20),
        ActionButtonsStyle(color: Colors.red, text: "Unregister Student", customFunction: () => dismissDeletePopup(context), icon: Icons.delete),
      ],
    ),
  );

}

Widget checkEnumType(ProjectActionsEnum projectActionsEnum)
{
}

Widget deleteAction({ProjectInformation project, BuildContext context, ProjectActionsEnum projectEnum})
{
  if (projectEnum == ProjectActionsEnum.DELETE_UNITS){
    return deleteUnit(context: context,project: project);
  } else if (projectEnum == ProjectActionsEnum.DELETE_PROJECT) {
    return deleteProject(context: context, project: project);
  } else if (projectEnum == ProjectActionsEnum.UNREGISTER_STUDENT) {
    return unregister(context: context,project: project);
  }

}

