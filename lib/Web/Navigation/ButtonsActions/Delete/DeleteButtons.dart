// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:cloud_functions/cloud_functions.dart';

Future<void> deleteFirebaseUnit(UnitInformation unit) async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('deleteUnit');
    final results = await callable({
        "unitID": unit.id
        });
    print(results.data);
}

Future<void> deleteFirebaseProject(ProjectInformation project) async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('deleteProject');
    final results = await callable({
        "projectID": project.id
        });
    print(results.data);
}

// NEED TO GET THE USER ID !!!!!!!!!
Future<void> removeUserFirebaseProject(ProjectInformation project) async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('removeUserToProject');
    final results = await callable({
        "projectID": project.id,
        // "userID" : user.id
        });
    print(results.data);
}

Widget dismissDeletePopup(UnitInformation unit, BuildContext context) {
  Navigator.of(context).pop();
  Navigator.pop(context);
  deleteFirebaseUnit(unit);
  return Container();
}

Widget dismissDeletePopupProject(
    ProjectInformation project, BuildContext context) {
  Navigator.of(context).pop();
  Navigator.pop(context);
deleteFirebaseProject(project);
  return Container();
}

Widget dismissUnregisterPopup(
    ProjectInformation project, BuildContext context) {
  Navigator.of(context).pop();
  Navigator.pop(context);
  removeUserFirebaseProject(project);
  return Container();
}

Widget deleteProject({ProjectInformation project, BuildContext context}) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Are you sure you want to delete the project : " + project.name + "?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        SizedBox(height: 20),
        ActionButtonsStyle(
            color: Colors.red,
            text: "Delete Project",
            customFunction: () => dismissDeletePopupProject(project, context),
            icon: Icons.delete),
      ],
    ),
  );
}

Widget deleteUnitPopup({UnitInformation unit, BuildContext context}) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Are you sure you want to delete the unit : " + unit.name + "?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        SizedBox(height: 20),
        ActionButtonsStyle(
            color: Colors.red,
            text: "Delete Unit",
            customFunction: () => dismissDeletePopup(unit, context),
            icon: Icons.delete),
      ],
    ),
  );
}

Widget unregister({ProjectInformation project, BuildContext context}) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Are you sure you want to unregister the student from : " +
              project.name +
              "?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        SizedBox(height: 20),
        ActionButtonsStyle(
            color: Colors.red,
            text: "Unregister Student",
            customFunction: () => dismissUnregisterPopup(project, context),
            icon: Icons.delete),
      ],
    ),
  );
}

Widget checkEnumType(ProjectActionsEnum projectActionsEnum) {}

Widget deleteUnit({UnitInformation unitInformation, BuildContext context}) {
  return deleteUnitPopup(context: context, unit: unitInformation);
}

Widget deleteAction(
    {ProjectInformation project,
    BuildContext context,
    ProjectActionsEnum projectEnum}) {
  if (projectEnum == ProjectActionsEnum.DELETE_PROJECT) {
    return deleteProject(context: context, project: project);
  } else if (projectEnum == ProjectActionsEnum.UNREGISTER_PROJECT_STUDENT) {
    return unregister(context: context, project: project);
  }
}
