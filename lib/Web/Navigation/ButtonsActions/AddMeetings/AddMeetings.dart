import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/PickRangeDate.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';

class AddMeetings extends StatefulWidget {
  final ProjectInformation currrentProject;
  const AddMeetings({Key key, this.currrentProject}) : super(key: key);

  @override
  _AddMeetingsState createState() => _AddMeetingsState();
}

class _AddMeetingsState extends State<AddMeetings> {
  Map<String, DateTime> dateTime = {
    "begin" : DateTime.now(),
    "end" : DateTime.now()
  };
  List<DateTime> tempDates;
  TextEditingController meetingNameController = TextEditingController();
  void setDatas()
  {
    Reunion reunion = Reunion();
    // MAXIME : Onsave button click : this function is called and here, save meetings into database
    // A sauvegarder : meetingNameController.text et datetime le project en parametre
    if (meetingNameController.text.isNotEmpty) {
      print (meetingNameController.text.toUpperCase());
    }
    print ("tempDates" + tempDates.toString());
    print ("tempDates bis " + (tempDates != null).toString());

    if (tempDates != null) {
      setState(() {
        reunion.date = tempDates;
      });
      print("entering tempdates");
    }
  }
  void setProjectDates(List<DateTime> picked)
  {
    setState(() {
      tempDates = picked;
    });
  }

  Widget emptyDates()
  {
    return
      Column(
        children: [
          displayProjectDates(DateTime.now(), DateTime.now()),
          pickRangeDate(context: context, beginDate: DateTime.now(), endDate: DateTime.now(), function: setProjectDates)
        ],
      );
  }
  Widget notEmptyDates()
  {
    return
      Column(
        children: [
          displayProjectDates(tempDates[0], tempDates[1]),
          pickRangeDate(context: context, beginDate: tempDates[0], endDate:tempDates[1], function: setProjectDates),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width/2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Create Meeting", style: TextStyle(color: Color(0xFF875BC5),fontSize: 21,fontFamily: "Montserrat", fontWeight: FontWeight.bold,    decoration: TextDecoration.underline,),),
            SizedBox(height: 20,),
            TextField(
              controller: meetingNameController,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Meeting Name',
              ),
            ),
            tempDates == null ? emptyDates() : notEmptyDates(),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // MAXIME : SAVE PROJECT REUNIONS
              children: [

                !ResponsiveLayout.isSmallScreen(context) ? saveDatas(function: setDatas, text: "Save Datas", textSize: 16) :saveDatas(function: setDatas, text: "Save Datas", textSize: 6)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


