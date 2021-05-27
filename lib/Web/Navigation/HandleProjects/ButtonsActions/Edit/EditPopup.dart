import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/EditButtonStyle.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/PickRangeDate.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';

class EditPopup extends StatefulWidget {
  final ProjectInformation currentProject;
  final ProjectActionsEnum editType;
  EditPopup({this.currentProject, this.editType});

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

    //MAXIME : this function checks the fields that have been changed for the Edit button
    if (temProjectDates != null) {
      widget.currentProject.beginDate = temProjectDates["begin"];
      widget.currentProject.endDate = temProjectDates["end"];
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
  }
  void saveUnit()
  {
    //MAXIME : this function checks the fields that have been changed for the Edit button
    if (temProjectDates != null) {
      widget.currentProject.beginDate = temProjectDates["begin"];
      widget.currentProject.endDate = temProjectDates["end"];
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
    if (widget.editType == ProjectActionsEnum.EDIT_PROJECT)
      return saveDatas(function: saveProject, text: "Save Project Datas");
    if (widget.editType == ProjectActionsEnum.EDIT_UNIT)
      return saveDatas(function: saveUnit, text: "Save Units Datas");

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
                widget.editType == ProjectActionsEnum.EDIT_UNIT ? usersAutocomplete.userAutocomplete(mailAddressesList: mailAddressesList, labelName: "Professor Mail", clear: false) : Container(),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Begin of the project", style: TextStyle(color: Color(0xFF875BC5),fontSize: 18,fontFamily: "Montserrat-Italic",decoration: TextDecoration.underline,),),
                    Text("End of the project", style: TextStyle(color: Color(0xFF875BC5),fontSize: 18,fontFamily: "Montserrat-Italic",decoration: TextDecoration.underline,),),
                  ],
                ),
                SizedBox(height:10),
                temProjectDates["begin"] == null ? displayProjectDates(widget.currentProject.beginDate, widget.currentProject.endDate) : displayProjectDates(temProjectDates["begin"], temProjectDates["end"]),
                SizedBox(height:10),
                pickRangeDate(context: context, beginDate: widget.currentProject.beginDate, endDate: widget.currentProject.endDate, function: setProjectDates),
                SizedBox(height:35),
                checkEditType()
              ],
            )
        )
      ],

    );
  }
}