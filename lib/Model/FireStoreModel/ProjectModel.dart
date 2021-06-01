import 'package:cloud_firestore/cloud_firestore.dart';

import 'Group.dart';

// Local Data
class ProjectModel {
  String id;
  String name;

  String unitid;

  List<Group> groups = [];
  List<String> usersId = [];

  DateTime projectstart = DateTime.now();
  DateTime registerEnd = DateTime.now();
  DateTime projectEnd = DateTime.now();

  // Init Data (avoid null Reference Exception)
  ProjectModel(
      {this.id = '',
      this.name = '',
      this.unitid = '',
      this.usersId = const <String>[],
      this.projectstart = null,
      this.registerEnd = null,
      this.projectEnd = null});

  // get object from json encoding
  factory ProjectModel.fromJson(Map<String, dynamic> parsedJson) {
    return new ProjectModel(
      id: parsedJson['id'] ?? '',
      name: parsedJson['name'] ?? '',
      unitid: parsedJson['unitid'] ?? '',
      usersId: List.from(parsedJson['usersId']) ?? const <String>[],
      projectstart: (parsedJson['projectstart'] as Timestamp).toDate() ?? null,
      registerEnd: (parsedJson['registerEnd'] as Timestamp).toDate() ?? null,
      projectEnd: (parsedJson['projectEnd'] as Timestamp).toDate() ?? null,
    );
  }

  // Create an json encode version of the Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'unitid': this.unitid,
      'usersId': this.usersId,
      'projectstart': this.projectstart,
      'registerEnd': this.registerEnd,
      'projectEnd': this.projectEnd,
    };
  }
}
