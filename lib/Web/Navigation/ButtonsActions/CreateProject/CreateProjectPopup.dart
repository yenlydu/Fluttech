import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Web/Style/EditButtonStyle.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/PickRangeDate.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter/services.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonEncode;

import 'package:flutter2/Web/WebConstants/Enumerations.dart';

class CreateProjectPopup extends StatefulWidget {
  final List mailAddressesList;
  final ProjectActionsEnum createType;
  const CreateProjectPopup(
      {Key key, @required this.mailAddressesList, this.createType})
      : super(key: key);

  @override
  _CreateProjectPopupState createState() => _CreateProjectPopupState();
}

class _CreateProjectPopupState extends State<CreateProjectPopup> {
  Map<String, TextEditingController> editController = {
    "title": TextEditingController(),
    "credits": TextEditingController(),
    "description": TextEditingController(),
  };
  ProjectInformation createdProject;
  UnitInformation createdUnit;
  String selectedMail;
  List<DateTime> pickedDates;
  Map<String, DateTime> tempDateRange = {
    "begin": null,
    "end": null,
  };
  UsersAutocomplete usersAutocomplete;
  void getEmail(str) {
    setState(() {
      selectedMail = str;
      //_showMyDialog();
    });
  }

  Future<void> createFirebaseUnit() async {
    print("Dans le FIREBASE create Unit !");
    print("${createdUnit.name}");
    final res = await http
        .post(
          Uri.parse(
              'https://us-central1-flutter2-f9a8c.cloudfunctions.net/addUnit'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'name': createdUnit.name,
            "creditAvailable": createdUnit.creditAvailable,
            "description": createdUnit.description,
            "registerEnd": "null",
            "unitStart": "createdUnit.unitStart",
            "unitEnd": "createdUnit.unitEnd"
          }),
        )
        .catchError((error) => {print(error)});
    print('[onRequest] unit Res: ${res.body.toString()}');
  }

  // Future<void> createFirebaseProject() async {
  //   final res = await http.post(
  //     Uri.parse(
  //         'https://us-central1-flutter2-f9a8c.cloudfunctions.net/addProject'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'name': createdProject.name,
  //       "description": createdProject.description,
  //       "registerEnd": null,
  //       "projectStart": createdProject.projectStart,
  //       "projectEnd": createdProject.projectEnd,
  //       "unitID": "41siY4eeSofeLxfSobzq"
  //     }),
  //   );
  //   print('[onRequest] project Res: ${res.body.toString()}');
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      createdProject = new ProjectInformation();
      createdUnit = new UnitInformation();
      usersAutocomplete = new UsersAutocomplete(
        getStudentSelected: getEmail,
      );
    });
  }

  void getEditing(tempEditTextController) {
    setState(() {
      editController = tempEditTextController;
      print(editController["title"].text);
    });
  }

  void getTimeRange(List<DateTime> tempPickedDates) {
    print(tempPickedDates[0]);
    setState(() {
      tempDateRange["begin"] = tempPickedDates[0];
      tempDateRange["end"] = tempPickedDates[1];
    });
  }

  void createProjects() {
    if (selectedMail != null) {
      usersAutocomplete.suggestionsTextFieldController.clear();
      createdProject.professorName = selectedMail;
      selectedMail = null;
    }
    if (editController["title"].text.isNotEmpty) {
      createdProject.name = editController["title"].text;
      editController["title"].clear();
    }
    if (editController["description"].text.isNotEmpty) {
      createdProject.description = editController["description"].text;
      editController["description"].clear();
    }
    if (pickedDates != null) {
      createdProject.projectStart = tempDateRange["begin"];
      createdProject.projectEnd = tempDateRange["end"];
      tempDateRange.clear();
    }
    // createFirebaseProject();
  }

  void createUnits() {
    if (editController["title"].text.isNotEmpty) {
      createdUnit.name = editController["title"].text;
      editController["title"].clear();
    }
    if (editController["description"].text.isNotEmpty) {
      createdUnit.description = editController["description"].text;
      editController["description"].clear();
    }
    if (editController["credits"].text.isNotEmpty) {
      createdUnit.creditAvailable = int.parse(editController["credits"].text);
      editController["credits"].clear();
    }
    if (pickedDates != null) {
      createdUnit.unitStart = Timestamp.fromDate(tempDateRange["begin"]);
      createdUnit.unitEnd = Timestamp.fromDate(tempDateRange["end"]);
      tempDateRange.clear();
      print("created project endsnot null");
    }
    print("Dans le create Unit !");
    createFirebaseUnit();
  }

  Widget checkCreateType() {
    if (widget.createType == ProjectActionsEnum.CREATE_PROJECT) {
      return !ResponsiveLayout.isSmallScreen(context)
          ? saveDatas(
              function: createProjects,
              text: "Save Projects Datas",
              textSize: 16)
          : saveDatas(
              function: createProjects,
              text: "Save Projects Datas",
              textSize: 10);
    } else {
      return !ResponsiveLayout.isSmallScreen(context)
          ? saveDatas(
              function: createUnits, text: "Save Units Datas", textSize: 16)
          : saveDatas(
              function: createUnits, text: "Save Units Datas", textSize: 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Creating Project",
                  style: TextStyle(
                    color: Color(0xFF875BC5),
                    fontSize: 21,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                titleDescriptionTextFields(
                    editController: editController,
                    setTextEditingController: getEditing),
                widget.createType == ProjectActionsEnum.CREATE_UNITS
                    ? usersAutocomplete.userAutocomplete(
                        mailAddressesList: widget.mailAddressesList,
                        labelName: "Professor Mail",
                        clear: false)
                    : Container(),
                SizedBox(height: 5),
                widget.createType == ProjectActionsEnum.CREATE_UNITS
                    ? Container(
                        width: 76.0,
                        child: TextFormField(
                          controller: editController["credits"],
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          maxLength: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            labelText: 'Credits',
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            tempDateRange["begin"] == null
                ? displayProjectDates(DateTime.now(), DateTime.now())
                : displayProjectDates(
                    tempDateRange["begin"], tempDateRange["end"]),
            tempDateRange["begin"] == null
                ? pickRangeDate(
                    context: context,
                    beginDate: DateTime.now(),
                    endDate: DateTime.now(),
                    function: getTimeRange)
                : pickRangeDate(
                    context: context,
                    beginDate: tempDateRange["begin"],
                    endDate: tempDateRange["end"],
                    function: getTimeRange),
            SizedBox(
              height: 20,
            ),
            checkCreateType()
          ]),
    ));
  }
}
