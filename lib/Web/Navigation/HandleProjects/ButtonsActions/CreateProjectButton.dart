import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/Style/EditButtonStyle.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/PickRangeDate.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';

class CreateProjectButton extends StatefulWidget {
  @override
  _CreateProjectButtonState createState() => _CreateProjectButtonState();
}

class _CreateProjectButtonState extends State<CreateProjectButton> {
  Map<String, DateTime> tempDateRange = {
    "begin" : DateTime.now(),
    "end" : DateTime.now(),
  };
  String selectedMail;
  UsersAutocomplete usersAutocomplete;

  Map<String, TextEditingController> editController = {
    "title": TextEditingController(),
    "description": TextEditingController(),
  };
  List<DateTime> pickedDates;
  ProjectInformation createdProject;
  List mailAddressesList = [
    "teacher1@epitech.eu",
    "teacher2@epitech.eu",
    "teacr2@epitech.eu",
    "azdef@epitech.eu",
    "prof@epitech.eu",
  ];
  void getEmail(str)
  {
    setState(() {
      selectedMail = str;
      //_showMyDialog();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createdProject = new ProjectInformation();
    usersAutocomplete = new UsersAutocomplete(getStudentSelected: getEmail,);
  }
  void getEditing(tempEditTextController)
  {
    setState(() {
      editController = tempEditTextController;
      print (editController["title"].text);
    });
  }

  void getTimeRange(List<DateTime> tempPickedDates)
  {
    print (tempPickedDates[0]);
    setState(() {
      tempDateRange["begin"] = tempPickedDates[0];
      tempDateRange["end"] = tempPickedDates[1];
    });
  }

  void getting()
  {
      if (editController["title"].text.isNotEmpty){
        createdProject.title = editController["title"].text;
        editController["title"].clear();
      }
      if (editController["description"].text.isNotEmpty) {
        createdProject.description = editController["description"].text;
        editController["description"].clear();
      }
      if (pickedDates != null) {
        createdProject.beginDate = tempDateRange["begin"];
        createdProject.endDate = tempDateRange["end"];
        tempDateRange.clear();
        print("created project endsnot null");
      }
    if (selectedMail != null) {
      usersAutocomplete.suggestionsTextFieldController.clear();
      createdProject.professorName = selectedMail;
      selectedMail = null;
    }
  }
  Widget createProjectPopup()
  {
    return AlertDialog(
        content: SizedBox(
        width: MediaQuery.of(context).size.width/2,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children:[

                Text("Creating Project", style: TextStyle(color: Color(0xFF875BC5),fontSize: 21,fontFamily: "Montserrat", fontWeight: FontWeight.bold,    decoration: TextDecoration.underline,),),
                SizedBox(height: 30,),
                titleDescriptionTextFields(editController: editController, setTextEditingController: getEditing),
                  usersAutocomplete.userAutocomplete(mailAddressesList: mailAddressesList, labelName: "Professor Mail", clear: false),
                  SizedBox(height:20),
                ],
              ),

                pickRangeDate(context: context, beginDate: DateTime.now(), endDate: DateTime.now(), function: getTimeRange),
                SizedBox(height: 20,),

                saveDatas(function: getting , text: "Save Datas"),
              ]
          ),
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 140,
      height: 50,
      child: ActionButtonsStyle(color: Colors.lightGreen, customFunction: createProjectPopup,text: "Create Project", icon: Icons.add, textStyle: TextStyle(fontSize: 15)),
    );
  }
}
