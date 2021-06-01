import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';

class UnitInformation
{
  factory UnitInformation.fromJson(Map<String, dynamic> json) {
    return UnitInformation(
      id: json['id'] as String,
      description: json['description'] as String,
      unitStart: json['unitStart'] as Timestamp,
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
  List <String> teachers = [];
  int creditAvailable = 0;
  UnitInformation(
      {this.id, this.name, this.projects, this.unitEnd, this.unitStart, this.description, this.managerCreatorID, this.creditAvailable, this.managerCreatorName});
}
