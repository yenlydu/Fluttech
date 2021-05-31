import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';

class UnitInformation
{
  String unitID;
  String name ="";
  List<ProjectInformation> projects;
  DateTime unitStart = DateTime.now();
  DateTime unitEnd = DateTime.now();
  String description = "";
  String managerCreatorID = "";
  String managerCreatorName = "";
  int creditAvailable = 0;
  UnitInformation(
      {this.unitID, this.name, this.projects, this.unitEnd, this.unitStart, this.description, this.managerCreatorID, this.creditAvailable, this.managerCreatorName});
}
