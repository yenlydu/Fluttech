// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonEncode;

Future<void> deleteFirebaseUnit(UnitInformation unit) async {
  print("Dans le FIREBASE delete Unit !");
  final res = await http
      .post(
        Uri.parse('https://us-central1-flutter2-f9a8c.cloudfunctions.net/deleteUnit'),
        // headers: <String, String>{
        //   'Content-Type': 'application/json',
        // },
        body: jsonEncode(<String, dynamic>{
          'unitID': "7OvPHCvPsKcjNYzccTq0",
        }),
      )
      .catchError((error) => {print(error)});
      // print('Status code: ${response.statusCode}');

  print('[onRequest] unit Res: ${res.body.toString()}');
}

// Future<void> deleteFirebaseProject(ProjectInformation project) async {
//   print("Dans le FIREBASE create Unit !");
//   final res = await http
//       .post(
//         Uri.parse(
//             'https://us-central1-flutter2-f9a8c.cloudfunctions.net/addUnit'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(<String, dynamic>{
//           'unitID': project.id,
//         }),
//       )
//       .catchError((error) => {print(error)});
//   print('[onRequest] unit Res: ${res.body.toString()}');
// }

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
// deleteFirebaseProject(project);
  return Container();
}

Widget dismissUnregisterPopup(
    ProjectInformation project, BuildContext context) {
  Navigator.of(context).pop();
  Navigator.pop(context);
// deleteFirebaseProject(project);
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
