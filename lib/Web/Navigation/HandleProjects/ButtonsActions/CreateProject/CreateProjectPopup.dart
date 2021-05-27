import 'package:flutter/material.dart';
import 'package:flutter2/Web/Style/EditButtonStyle.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/PickRangeDate.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
class CreateProjectPopup extends StatefulWidget {
  final List mailAddressesList;
  final ProjectActionsEnum createType;
  const CreateProjectPopup({Key key, @required this.mailAddressesList, this.createType}) : super(key: key);

  @override
  _CreateProjectPopupState createState() => _CreateProjectPopupState();
}

class _CreateProjectPopupState extends State<CreateProjectPopup> {
  Map<String, TextEditingController> editController = {
    "title": TextEditingController(),
    "description": TextEditingController(),
  };
  String selectedMail;
  List<DateTime> pickedDates;
  ProjectInformation createdProject;
  Map<String, DateTime> tempDateRange = {
    "begin" : null,
    "end" : null,
  };
  UsersAutocomplete usersAutocomplete;
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
    setState(() {
      createdProject = new ProjectInformation();
      usersAutocomplete = new UsersAutocomplete(getStudentSelected: getEmail,);

    });
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


  void createProjects()
  {
    if (selectedMail != null) {
      usersAutocomplete.suggestionsTextFieldController.clear();
      createdProject.professorName = selectedMail;
      selectedMail = null;
    }
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
    }

  }
  void createUnits()
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

  }

  Widget checkCreateType()
  {
    if (widget.createType == ProjectActionsEnum.CREATE_PROJECT) {
      return saveDatas(function: createProjects, text: "Save Projects Datas");
    }
    else {
      return saveDatas(function: createUnits, text: "Save Units Datas");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    widget.createType == ProjectActionsEnum.CREATE_UNITS? usersAutocomplete.userAutocomplete(mailAddressesList: widget.mailAddressesList, labelName: "Professor Mail", clear: false) : Container(),
                    SizedBox(height:20),
                  ],
                ),
                tempDateRange["begin"] == null? displayProjectDates(DateTime.now(), DateTime.now()): displayProjectDates(tempDateRange["begin"], tempDateRange["end"]),

                tempDateRange["begin"] == null? pickRangeDate(context: context, beginDate: DateTime.now(), endDate: DateTime.now(), function: getTimeRange) : pickRangeDate(context: context, beginDate: tempDateRange["begin"], endDate: tempDateRange["end"], function: getTimeRange),
                SizedBox(height: 20,),
                checkCreateType()
              ]
          ),
        )
    );
    }
}
