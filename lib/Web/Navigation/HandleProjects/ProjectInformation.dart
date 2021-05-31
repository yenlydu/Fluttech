import 'package:flutter/material.dart';

class Reunion
{
  String reunionName = "";
  List<DateTime> date;

  Reunion({ this.reunionName, this.date});
}

class Teammates {
  String mail = "";
  Icon image;

  Teammates({@required this.mail, this.image});
}

class ProjectInformation
{
  List<String> studentsRegistered = [];
  String unitID;
  String name = "";
  String description = "";
  List <Teammates> teammates = [];
  DateTime projectStart = DateTime.now();
  DateTime projectEnd = DateTime.now();
  String requirements = "";
  String professorName = "";
  int allowedStudents = 1;
  List<Reunion> reunions = [];

  ProjectInformation({ this.name, this.teammates, this.studentsRegistered,this.description,  this.projectStart,  this.projectEnd, this.requirements, this.allowedStudents, this.reunions, this.professorName});
}
