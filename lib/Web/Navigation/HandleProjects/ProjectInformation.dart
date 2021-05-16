import 'package:flutter/material.dart';

class Reunion
{
  String reunionName;
  DateTime date;
//  TimeOfDay releaseTime = TimeOfDay(hour: 15, minute: 0);
  Reunion({@required this.reunionName, @required this.date});
}

class ProjectInformation
{
  String title;
  String description;
  DateTime beginDate;
  DateTime endDate;
  String requirements;
  String professorName;
  int allowedStudents = 1;
  List<Reunion> reunions;
  ProjectInformation({@required this.title, @required this.description, @required this.beginDate, @required this.endDate, this.requirements, this.allowedStudents, this.reunions, this.professorName});
}
