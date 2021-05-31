import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:intl/intl.dart';

Widget popUpTitle({@required BuildContext context, ProjectInformation project,UnitInformation unitInformation,@required String text})
{

  return Container(
    width: MediaQuery.of(context).size.width/2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
      crossAxisAlignment: CrossAxisAlignment.center ,//Center Column contents horizontally,
      children:[
        Flexible(child:         Text(text, style: TextStyle(color: Color(0xFF875BC5),fontSize: 21,fontFamily: "Montserrat", fontWeight: FontWeight.bold,    decoration: TextDecoration.underline,),),),
        Flexible(child:         project != null ? Text(" : " + project.name, style: TextStyle(fontFamily: "Montserrat-Italic", fontSize: 18),) : Text(" : " + unitInformation.name, style: TextStyle(fontFamily: "Montserrat-Italic", fontSize: 18),),
        )

      ],
    ),
  );
}

Widget displayProjectDates(DateTime beginDate, DateTime endDate)
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(DateFormat('yyyy-MM-dd').format(beginDate)),
      Text(DateFormat('yyyy-MM-dd').format(endDate))
      ],
  );

}