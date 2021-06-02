// Local Unit Data
import 'package:cloud_firestore/cloud_firestore.dart';

class UnitModel {
  String id;
  String name;
  String description;
  List<String> skillsToBeAcquired;
  int creditAvailable;

  String managerCreatorID;
  String managerCreatorName;

  List<String> teachers;

  List<String> projectList;
  List<String> usersID;
  List<String> appointementList;

  DateTime unitStart = DateTime.now();
  DateTime registerEnd = DateTime.now();
  DateTime unitEnd = DateTime.now();

  // Init Unit Data (avoid null Reference Exception)
  UnitModel({
    this.id = '',
    this.name = '',
    this.description = '',
    this.skillsToBeAcquired = const <String>[],
    this.creditAvailable = 0,
    this.managerCreatorID = '',
    this.managerCreatorName = '',
    this.teachers = const <String>[],
    this.projectList = const <String>[],
    this.usersID = const <String>[],
    this.appointementList = const <String>[],
    this.unitStart = null,
    this.registerEnd = null,
    this.unitEnd = null,
  });

  // get Unit object from json encoding
  factory UnitModel.fromJson(Map<String, dynamic> parsedJson) {
    return new UnitModel(
      id: parsedJson['id'] ?? '',
      name: parsedJson['name'] ?? '',
      description: parsedJson['description'] ?? '',
      skillsToBeAcquired:
          List.from(parsedJson['skillsToBeAcquired']) ?? const <String>[],
      creditAvailable: parsedJson['creditAvailable'] ?? 0,
      managerCreatorID: parsedJson['managerCreatorID'] ?? '',
      managerCreatorName: parsedJson['managerCreatorName'] ?? '',
      teachers: List.from(parsedJson['teachers']) ?? const <String>[],
      projectList: List.from(parsedJson['projectList']) ?? const <String>[],
      usersID: List.from(parsedJson['usersID']) ?? const <String>[],
      appointementList:
          List.from(parsedJson['appointementList']) ?? const <String>[],
      unitStart: (parsedJson['unitStart'] == null)
          ? DateTime.now()
          : (parsedJson['unitStart'] as Timestamp).toDate() ?? null,
      registerEnd: (parsedJson['registerEnd'] == null)
          ? DateTime.now()
          : (parsedJson['registerEnd'] as Timestamp).toDate() ?? null,
      unitEnd: (parsedJson['unitEnd'] == null)
          ? DateTime.now()
          : (parsedJson['unitEnd'] as Timestamp).toDate() ?? null,
    );
  }

  // Create an json encode version of the Unit Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'skillsToBeAcquired': this.skillsToBeAcquired,
      'creditAvailable': this.creditAvailable,
      'managerCreatorID': this.managerCreatorID,
      'managerCreatorName': this.managerCreatorName,
      'teachers': this.teachers,
      'projectList': this.projectList,
      'usersID': this.usersID,
      'appointementList': this.appointementList,
      'unitStart': this.unitStart,
      'registerEnd': this.registerEnd,
      'unitEnd': this.unitEnd,
    };
  }
}
