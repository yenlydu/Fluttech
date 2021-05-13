import 'package:flutter/material.dart';

class Reunion
{
  String reunionName;
  String date;
//  TimeOfDay releaseTime = TimeOfDay(hour: 15, minute: 0);
  TimeOfDay beginDate;
  TimeOfDay endDate;

  Reunion({@required this.reunionName, @required this.date, @required this.beginDate, @required this.endDate});
}

class ProjectInformation
{
  String title;
  String description;
  String beginDate;
  String endDate;
  String requirements;
  int allowedStudents = 1;
  List<Reunion> reunions;
  ProjectInformation({@required this.title, @required this.description, @required this.beginDate, @required this.endDate, this.requirements, this.allowedStudents, this.reunions});
}
