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
  factory ProjectInformation.fromJson(Map<String, dynamic> json) {
    return ProjectInformation(
      name: json['name'] as String,
      id: json['id'] as String,
      description: json['description'] as String,
    );
  }

  List<String> studentsRegistered = [];
  String unitID = "";
  String id = "";
  String name = "";
  String description = "";
  List <Teammates> teammates = [];
  DateTime projectStart = DateTime.now();
  DateTime projectEnd = DateTime.now();
  String requirements = "";
  String professorName = "";
  int allowedStudents = 1;
  List<Reunion> reunions = [];

  ProjectInformation({ this.name, this.id, this.teammates, this.studentsRegistered,this.description,  this.projectStart,  this.projectEnd, this.requirements, this.allowedStudents, this.reunions, this.professorName});
}
