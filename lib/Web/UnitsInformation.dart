import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';

class UnitInformation
{
  factory UnitInformation.fromJson(Map<String, dynamic> json) {

    print ("entered");
    print (json['projectList'].runtimeType);
    return UnitInformation(
      id: json['id'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      usersId: json['usersId'] as List,
        managerCreatorID: json['managerCreatorID'] as String,
      teachers: json['teachers'] as List,
      creditAvailable: json['creditAvailable'] as int,
//      projectList: json['usersId'] as List<String>,

    );
  }
  String id;
  String name ="";
  List <String> usersId = [];
  List <String> projectList = [];
  List<ProjectInformation> projects;
  Timestamp unitStart = Timestamp.now();
  Timestamp unitEnd = Timestamp.now();
  String description = "";
  String managerCreatorID = "";
  String managerCreatorName = "";// ?
  List teachers = [];
  int creditAvailable = 0;
  UnitInformation(
      {this.id, this.name, this.usersId,this.teachers, this.projects, this.unitEnd, this.unitStart, this.description, this.managerCreatorID, this.creditAvailable, this.managerCreatorName});
}
