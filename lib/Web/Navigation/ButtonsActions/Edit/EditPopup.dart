import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/EditButtonStyle.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/PickRangeDate.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:intl/intl.dart';

class EditPopup extends StatefulWidget {
  final ProjectInformation projectEdit;
  final UnitInformation unitEdit;
  EditPopup({this.projectEdit, this.unitEdit});

  @override
  _EditPopupState createState() => _EditPopupState();
}

class _EditPopupState extends State<EditPopup> {
  UsersAutocomplete usersAutocomplete;
  String selectedMail;
  Map<String, DateTime> temProjectDates = {};
  Map<String, TextEditingController> editController = {
    "description": TextEditingController(),
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

  void saveProject()
  {

    setState(() {
      if (temProjectDates != null) {
        widget.projectEdit.projectStart = temProjectDates["begin"];
        widget.projectEdit.projectEnd = temProjectDates["end"];
        temProjectDates = null;
        //MAXIME : SAVE BEGIN PROJECT DATE
      };

      if (editController["description"].text.isNotEmpty){
        print("description not null");
        editController["description"].clear();
        //MAXIME : SAVE PROJECT DESCRIPTION

      };
      if (editController["title"].text.isNotEmpty) {
        print("title not null");
        editController["title"].clear();
        //MAXIME : SAVE PROJECT TITLE
      }

    });
    //MAXIME : this function checks the fields that have been changed for the Edit button
  }
  void saveUnit()
  {
    setState(() {
      //MAXIME : this function checks the fields that have been changed for the Edit button
      if (temProjectDates != null) {
        widget.unitEdit.unitStart = Timestamp.fromDate(temProjectDates["begin"]);
        widget.unitEdit.unitEnd = Timestamp.fromDate(temProjectDates["end"]);
        temProjectDates = null;
        //MAXIME : SAVE BEGIN PROJECT DATE
      };
      if (selectedMail != null) {
        print("mail address not null");
        //MAXIME : SAVE TEACHER MAIL ADDRESS
        selectedMail = null;
        usersAutocomplete.suggestionsTextFieldController.clear();
      };
      if (editController["description"].text.isNotEmpty){
        print("description not null");
        editController["description"].clear();
        //MAXIME : SAVE PROJECT DESCRIPTION

      };
      if (editController["title"].text.isNotEmpty) {
        print("title not null");
        editController["title"].clear();
        //MAXIME : SAVE PROJECT TITLE
      }
    });
  }

  void setProjectDates(List<DateTime> picked)
  {
    setState(() {
      temProjectDates['begin'] = picked[0];
      temProjectDates['end'] = picked[1];
    });
  }

  void getEmail(str)
  {
    setState(() {
      selectedMail = str;
      //_showMyDialog();
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      usersAutocomplete = new UsersAutocomplete(getStudentSelected: getEmail,);
    });
  }

  void getEditing(tempEditTextController)
  {
    setState(() {
      editController = tempEditTextController;
    });
  }
  OverlaySupportEntry test()
  {
    showSimpleNotification(
        Text(
          "Nothing to save !",
          textAlign: TextAlign.center,
        ),
        background: Colors.red);
  }

  Widget checkEditType()
  {
    if (widget.projectEdit != null)
      return saveDatas(function: saveProject, text: "Save Project Datas");
    else if (widget.unitEdit != null)
      return saveDatas(function: saveUnit, text: "Save Units Datas");

  }

  Widget displayingEmptyTempDates()
  {
    if (widget.projectEdit != null) {
      return displayProjectDates(widget.projectEdit.projectStart, widget.projectEdit.projectEnd);
    } else if (widget.unitEdit != null)
      return displayProjectDates(widget.unitEdit.unitStart.toDate(), widget.unitEdit.unitEnd.toDate());
  }

  Widget pickRangeTypeDate()
  {
    if (widget.projectEdit != null)
      return pickRangeDate(context: context, beginDate: widget.projectEdit.projectStart, endDate: widget.projectEdit.projectEnd, function: setProjectDates);
    else if (widget.unitEdit != null)
      return pickRangeDate(context: context, beginDate: widget.unitEdit.unitStart.toDate(), endDate: widget.unitEdit.unitEnd.toDate(), function: setProjectDates);

  }

  Widget displayBigScreen()
  {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Begin of the project", style: TextStyle(color: Color(0xFF875BC5),fontSize: 18,fontFamily: "Montserrat-Italic",decoration: TextDecoration.underline,),),
            Text("End of the project", style: TextStyle(color: Color(0xFF875BC5),fontSize: 18,fontFamily: "Montserrat-Italic",decoration: TextDecoration.underline,),),
          ],
        ),                temProjectDates["begin"] == null ? displayingEmptyTempDates() : displayProjectDates(temProjectDates["begin"], temProjectDates["end"]),


      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children :[
        SizedBox(height:20),
        Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleDescriptionTextFields(setTextEditingController: getEditing, editController: editController),
                widget.unitEdit != null ? usersAutocomplete.userAutocomplete(mailAddressesList: mailAddressesList, labelName: "Professor Mail", clear: false) : Container(),
                SizedBox(height:20),
                !ResponsiveLayout.isSmallScreen(context) ?
                    displayBigScreen()
                    :
                    Center(
                      child:                   Column(
                        children: [
                          Text("Begin of the project", style: TextStyle(color: Color(0xFF875BC5),fontSize: 18,fontFamily: "Montserrat-Italic",decoration: TextDecoration.underline,),),
                          temProjectDates["begin"] == null ? Text(DateFormat('yyyy-MM-dd').format(DateTime.now())): Text(DateFormat('yyyy-MM-dd').format(temProjectDates["begin"])),
                          Text("End of the project", style: TextStyle(color: Color(0xFF875BC5),fontSize: 18,fontFamily: "Montserrat-Italic",decoration: TextDecoration.underline,),),
                          temProjectDates["end"] == null ? Text(DateFormat('yyyy-MM-dd').format(DateTime.now())): Text(DateFormat('yyyy-MM-dd').format(temProjectDates["end"])),
                        ],
                      ),

                    )
,
                SizedBox(height:10),
                SizedBox(height:10),
                pickRangeTypeDate(),
                SizedBox(height:35),
                checkEditType()
              ],
            )
        )
      ],

    );
  }
}