import 'dart:io';

import 'package:flutter2/Model/AppointementModel.dart';
import 'package:flutter2/Model/ProjectModel.dart';

// Local Unit Data
class UnitModel {
  String id;

  String name;
  String description;
  int creditAvailable;

  String usercreatorID;
  String usercreatorName;

  List<ProjectModel> projectlist;
  List<String> usersId;
  List<AppointementModel> appointementlist;

  DateTime unitStart = DateTime.now();
  DateTime registerEnd = DateTime.now();
  DateTime unitEnd = DateTime.now();

  // Init Unit Data (avoid null Reference Exception)
  UnitModel({
    this.name = '',
    this.description = '',
    this.usercreatorID = '',
    this.usercreatorName = '',
    this.projectlist = const <ProjectModel>[],
    this.usersId = const <String>[],
    this.appointementlist = const <AppointementModel>[],
    this.creditAvailable = 0,
    this.unitStart = null,
    this.registerEnd = null,
    this.unitEnd = null,
  });

  // get Unit object from json encoding
  factory UnitModel.fromJson(Map<String, dynamic> parsedJson) {
    return new UnitModel(
      name: parsedJson['name'] ?? '',
      description: parsedJson['description'] ?? '',
      usercreatorID: parsedJson['usercreatorID'] ?? '',
      usercreatorName: parsedJson['usercreatorName'] ?? '',
      creditAvailable: parsedJson['creditAvailable'] ?? '',
      projectlist: parsedJson['projectlist'] ?? '',
      usersId: parsedJson['usersId'] ?? '',
      appointementlist: parsedJson['appointementlist'] ?? '',
      unitStart: parsedJson['unitStart'] ?? '',
      registerEnd: parsedJson['registerEnd'] ?? '',
      unitEnd: parsedJson['unitEnd'] ?? '',
    );
  }

  // Create an json encode version of the Unit Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'description': this.description,
      'usercreatorID': this.usercreatorID,
      'usercreatorName': this.usercreatorName,
      'creditAvailable': this.creditAvailable,
      'projectlist': this.projectlist,
      'usersId': this.usersId,
      'appointementlist': this.appointementlist,
      'unitStart': this.unitStart,
      'registerEnd': this.registerEnd,
      'unitEnd': this.unitEnd,
    };
  }
}
