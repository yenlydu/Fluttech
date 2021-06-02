import 'package:cloud_firestore/cloud_firestore.dart';

// Local Data
class ProjectModel {
  String id;
  String name;
  String description;

  String unitID;

  List<String> usersID = [];

  DateTime projectStart = DateTime.now();
  DateTime registerEnd = DateTime.now();
  DateTime projectEnd = DateTime.now();

  // Init Data (avoid null Reference Exception)
  ProjectModel(
      {this.id = '',
      this.name = '',
      this.description = '',
      this.unitID = '',
      this.usersID = const <String>[],
      this.projectStart = null,
      this.registerEnd = null,
      this.projectEnd = null});

  // get object from json encoding
  factory ProjectModel.fromJson(Map<String, dynamic> parsedJson) {
    return new ProjectModel(
      id: parsedJson['id'] ?? '',
      name: parsedJson['name'] ?? '',
      description: parsedJson['description'] ?? '',
      unitID: parsedJson['unitID'] ?? '',
      usersID: List.from(parsedJson['usersID']) ?? const <String>[],
      projectStart: (parsedJson['projectStart'] == null)
          ? DateTime.now()
          : (parsedJson['projectStart'] as Timestamp).toDate() ?? null,
      registerEnd: (parsedJson['registerEnd'] == null)
          ? DateTime.now()
          : (parsedJson['registerEnd'] as Timestamp).toDate() ?? null,
      projectEnd: (parsedJson['projectEnd'] == null)
          ? DateTime.now()
          : (parsedJson['projectEnd'] as Timestamp).toDate() ?? null,
    );
  }

  // Create an json encode version of the Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'unitID': this.unitID,
      'usersID': this.usersID,
      'projectStart': this.projectStart,
      'registerEnd': this.registerEnd,
      'projectEnd': this.projectEnd,
    };
  }
}
