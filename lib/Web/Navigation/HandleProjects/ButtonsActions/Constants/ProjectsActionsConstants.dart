import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:intl/intl.dart';

Widget popUpTitle({@required BuildContext context, @required ProjectInformation project, @required String text})
{
  return Container(
    width: MediaQuery.of(context).size.width/2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
      crossAxisAlignment: CrossAxisAlignment.center ,//Center Column contents horizontally,
      children:[
        Text(text, style: TextStyle(color: Color(0xFF875BC5),fontSize: 21,fontFamily: "Montserrat", fontWeight: FontWeight.bold,    decoration: TextDecoration.underline,),),
        Text(" : " + project.title, style: TextStyle(fontFamily: "Montserrat-Italic", fontSize: 18),),

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