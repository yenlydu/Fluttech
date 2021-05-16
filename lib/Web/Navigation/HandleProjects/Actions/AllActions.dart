import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/Actions/ProjectsActions.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';


Widget actionDeletingProject(BuildContext context)
{
  Navigator.of(context).pop();
  Navigator.pop(context);
  return Container();
}

Widget deleteAction(ProjectInformation project, BuildContext context)
{
  return AlertDialog(
    content:Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Are you sure you want to delete " + project.title + "?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
        sizedBox(20),
        ActionButtonsStyle(color: Colors.red, text: "Delete", customFunction: () => actionDeletingProject(context), icon: Icons.delete),
      ],
    ),
  );
}