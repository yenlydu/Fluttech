import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/EditButtonStyle.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/PickRangeDate.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
// import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';
// import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
// import 'package:intl/intl.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Web/Style/EditButtonStyle.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/PickRangeDate.dart';
// import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter/services.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'package:flutter2/Web/WebConstants/Enumerations.dart';
class EditPopup extends StatefulWidget {
  final ProjectInformation projectEdit;
  final UnitInformation unitEdit;
  EditPopup({this.projectEdit, this.unitEdit});

  @override
  _EditPopupState createState() => _EditPopupState();
}

class _EditPopupState extends State<EditPopup> {
  UsersAutocomplete usersAutocomplete;
  UsersAutocomplete addStudent;
  String selectedMail;
  String studentMail;
  Map<String, DateTime> temProjectDates = {};
  Map<String, TextEditingController> editController = {
    "description": TextEditingController(),
    "credits" : TextEditingController(),
    "title": TextEditingController(),
  };

  // MAXIME : recupérer toutes les addresses mails et les transformer avec le type List
  List mailAddressesList = [
    "teacher1@epitech.eu",
    "teacher2@epitech.eu",
    "teacr2@epitech.eu",
    "azdef@epitech.eu",
    "prof@epitech.eu",
  ];

  Future<void> updateFirebaseProject() async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('updateProject');
    final results = await callable({
      'name': widget.projectEdit.name,
      'appointementList': [],
      "registerEnd": null,
      'projectID': widget.projectEdit.id,
      'description': widget.projectEdit.description,
      'projectEnd': null,
      'projectStart': null,
    });
    print(results.data);
  }

  Future<void> updateFirebaseUnit() async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('updateUnit');
        print("${widget.unitEdit.name}, ${widget.unitEdit.creditAvailable}, ${widget.unitEdit.description}, ${widget.unitEdit.managerCreatorID}, ${widget.unitEdit.managerCreatorName}");
    final results = await callable({
      'name': widget.unitEdit.name,
      'skillsToBeAcquired': [],
      "creditAvailable": widget.unitEdit.creditAvailable,
      'unitID': widget.unitEdit.id,
      'description': widget.unitEdit.description,
      "registerEnd": null,
      'unitEnd': null,
      'unitStart': null,
      "managerCreatorID": widget.unitEdit.managerCreatorID,
      "managerCreatorName": widget.unitEdit.managerCreatorName
    });
    print(results.data);
  }

  void saveProject() {
    setState(() {
      // if (temProjectDates != null) {
      //   widget.projectEdit.projectStart = temProjectDates["begin"];
      //   widget.projectEdit.projectEnd = temProjectDates["end"];
      //   temProjectDates = null;
      //   //MAXIME : SAVE BEGIN PROJECT DATE
      // }
      // ;
      if (editController["description"].text.isNotEmpty) {
        print("description not null");
        widget.projectEdit.description = editController["description"].text;
        editController["description"].clear();
        //MAXIME : SAVE PROJECT DESCRIPTION

      }
      ;
      if (editController["title"].text.isNotEmpty) {
        print("title not null");
        widget.projectEdit.name = editController["title"].text;
        editController["title"].clear();
        //MAXIME : SAVE PROJECT TITLE
      }
    });
    updateFirebaseProject();
    //MAXIME : this function checks the fields that have been changed for the Edit button
  }

  void saveUnit() {
    setState(() {
      //MAXIME : this function checks the fields that have been changed for the Edit button
      // if (temProjectDates != null) {
      //   widget.unitEdit.unitStart =
      //       temProjectDates["begin"];
      //   widget.unitEdit.unitEnd = temProjectDates["end"];
      //   temProjectDates = null;
      //   //MAXIME : SAVE BEGIN PROJECT DATE
      // }
      // ;
      if (editController["credits"].text.isNotEmpty) {
        widget.unitEdit.creditAvailable = int.parse(editController["credits"].text);
        editController["credits"].clear();
      }

      if (selectedMail != null) {
        print("mail address not null");
        //MAXIME : SAVE TEACHER MAIL ADDRESS
        widget.unitEdit.teachers.add(selectedMail);
        selectedMail = null;
        usersAutocomplete.suggestionsTextFieldController.clear();
      }
      ;
      if (editController["description"].text.isNotEmpty) {
        print("description not null");
        widget.unitEdit.description = editController["description"].text;
        editController["description"].clear();
        //MAXIME : SAVE PROJECT DESCRIPTION

      }
      ;
      if (editController["title"].text.isNotEmpty) {
        print("title not null");
        widget.unitEdit.name = editController["title"].text;
        editController["title"].clear();
        //MAXIME : SAVE PROJECT TITLE
      }
    });
    updateFirebaseUnit();
  }

  void setProjectDates(List<DateTime> picked) {
    setState(() {
      temProjectDates['begin'] = picked[0];
      temProjectDates['end'] = picked[1];
    });
  }

  void getEmail(str) {
    setState(() {
      selectedMail = str;
      //_showMyDialog();
    });
  }


  @override
  void initState() {
    super.initState();
    setState(() {
      usersAutocomplete = new UsersAutocomplete(
        getStudentSelected: getEmail,
      );
    });
  }

  void getEditing(tempEditTextController) {
    setState(() {
      editController = tempEditTextController;
    });
  }

  OverlaySupportEntry test() {
    showSimpleNotification(
        Text(
          "Nothing to save !",
          textAlign: TextAlign.center,
        ),
        background: Colors.red);
  }

  Widget checkEditType() {
    if (widget.projectEdit != null)
      return saveDatas(function: saveProject, text: "Save Project Datas");
    else if (widget.unitEdit != null)
      return saveDatas(function: saveUnit, text: "Save Units Datas");
  }

  Widget displayingEmptyTempDates() {
    if (widget.projectEdit != null) {
      return displayProjectDates(
          widget.projectEdit.projectStart, widget.projectEdit.projectEnd);
    } else if (widget.unitEdit != null)
      return displayProjectDates(
          widget.unitEdit.unitStart, widget.unitEdit.unitEnd);
  }

  Widget pickRangeTypeDate() {
    if (widget.projectEdit != null)
      return pickRangeDate(
          context: context,
          beginDate: widget.projectEdit.projectStart,
          endDate: widget.projectEdit.projectEnd,
          function: setProjectDates);
    else if (widget.unitEdit != null)
      return pickRangeDate(
          context: context,
          beginDate: widget.unitEdit.unitStart,
          endDate: widget.unitEdit.unitEnd,
          function: setProjectDates);
  }

  Widget displayBigScreen() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Begin of the project",
              style: TextStyle(
                color: Color(0xFF875BC5),
                fontSize: 18,
                fontFamily: "Montserrat-Italic",
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              "End of the project",
              style: TextStyle(
                color: Color(0xFF875BC5),
                fontSize: 18,
                fontFamily: "Montserrat-Italic",
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        temProjectDates["begin"] == null
            ? displayingEmptyTempDates()
            : displayProjectDates(
                temProjectDates["begin"], temProjectDates["end"]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleDescriptionTextFields(
                setTextEditingController: getEditing,
                editController: editController),
            widget.unitEdit != null
                ? usersAutocomplete.userAutocomplete(
                    mailAddressesList: mailAddressesList,
                    labelName: "Professor Mail",
                    clear: false)
                : Container(),
            SizedBox(height: 20),
            widget.unitEdit != null
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

            // !ResponsiveLayout.isSmallScreen(context)
            //     ? displayBigScreen()
            //     : Center(
            //         child: Column(
            //           children: [
            //             Text(
            //               "Begin of the project",
            //               style: TextStyle(
            //                 color: Color(0xFF875BC5),
            //                 fontSize: 18,
            //                 fontFamily: "Montserrat-Italic",
            //                 decoration: TextDecoration.underline,
            //               ),
            //             ),
            //             temProjectDates["begin"] == null
            //                 ? Text(
            //                     DateFormat('yyyy-MM-dd').format(DateTime.now()))
            //                 : Text(DateFormat('yyyy-MM-dd')
            //                     .format(temProjectDates["begin"])),
            //             Text(
            //               "End of the project",
            //               style: TextStyle(
            //                 color: Color(0xFF875BC5),
            //                 fontSize: 18,
            //                 fontFamily: "Montserrat-Italic",
            //                 decoration: TextDecoration.underline,
            //               ),
            //             ),
            //             temProjectDates["end"] == null
            //                 ? Text(
            //                     DateFormat('yyyy-MM-dd').format(DateTime.now()))
            //                 : Text(DateFormat('yyyy-MM-dd')
            //                     .format(temProjectDates["end"])),
            //           ],
            //         ),
            //       ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            pickRangeTypeDate(),
            SizedBox(height: 35),
            checkEditType()
          ],
        ))
      ],
    );
  }
}
