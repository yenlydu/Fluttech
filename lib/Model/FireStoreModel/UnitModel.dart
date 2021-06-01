// Local Unit Data
import 'package:cloud_firestore/cloud_firestore.dart';

class UnitModel {
  String id;
  String name;
  String description;
  List<String> skillstobeacquired;
  int creditAvailable;

  String usercreatorID;
  String usercreatorName;

  List<String> teachers;

  List<String> projectlist;
  List<String> usersId;
  List<String> appointementlist;

  DateTime unitStart = DateTime.now();
  DateTime registerEnd = DateTime.now();
  DateTime unitEnd = DateTime.now();

  // Init Unit Data (avoid null Reference Exception)
  UnitModel({
    this.id = '',
    this.name = '',
    this.description = '',
    this.skillstobeacquired = const <String>[],
    this.creditAvailable = 0,
    this.usercreatorID = '',
    this.usercreatorName = '',
    this.teachers = const <String>[],
    this.projectlist = const <String>[],
    this.usersId = const <String>[],
    this.appointementlist = const <String>[],
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
      skillstobeacquired:
          List.from(parsedJson['skillstobeacquired']) ?? const <String>[],
      creditAvailable: parsedJson['creditAvailable'] ?? 0,
      usercreatorID: parsedJson['usercreatorID'] ?? '',
      usercreatorName: parsedJson['usercreatorName'] ?? '',
      teachers: List.from(parsedJson['teachers']) ?? const <String>[],
      projectlist: List.from(parsedJson['projectlist']) ?? const <String>[],
      usersId: List.from(parsedJson['usersId']) ?? const <String>[],
      appointementlist:
          List.from(parsedJson['appointementlist']) ?? const <String>[],
      unitStart: (parsedJson['unitStart'] as Timestamp).toDate() ?? null,
      registerEnd: (parsedJson['registerEnd'] as Timestamp).toDate() ?? null,
      unitEnd: (parsedJson['unitEnd'] as Timestamp).toDate() ?? null,
    );
  }

  // Create an json encode version of the Unit Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'skillstobeacquired': this.skillstobeacquired,
      'creditAvailable': this.creditAvailable,
      'usercreatorID': this.usercreatorID,
      'usercreatorName': this.usercreatorName,
      'teachers': this.teachers,
      'projectlist': this.projectlist,
      'usersId': this.usersId,
      'appointementlist': this.appointementlist,
      'unitStart': this.unitStart,
      'registerEnd': this.registerEnd,
      'unitEnd': this.unitEnd,
    };
  }
}
