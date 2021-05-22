import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/PickRangeDate.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';

Widget addMeetings({@required BuildContext context, @required ProjectInformation currrentProject})
{
  TextEditingController meetingNameController = TextEditingController();
  void setDatas()
  {
    Reunion test;
    // MAXIME : Onsave button click : this function is called and here, save meetings into database
    // A sauvegarder : meetingNameController.text et datetime le project en parametre
    print (meetingNameController.text.toUpperCase());
  }

  void setProjectDates(List<DateTime> picked)
  {
    print (picked[0]);
    print (picked[1]);
  }

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
          displayProjectDates(currrentProject.beginDate, currrentProject.endDate),
          SizedBox(height: 10,),
          pickRangeDate(context: context, beginDate: currrentProject.beginDate, endDate: currrentProject.endDate, function: setProjectDates),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // MAXIME : SAVE PROJECT REUNIONS
            children: [
              saveDatas(function: setDatas)
            ],
          ),
        ],
      ),
    ),
  );
}
