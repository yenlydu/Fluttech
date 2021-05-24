import 'Group.dart';

// Local Data
class ProjectModel {
  String id;
  String name;

  String unitid;

  List<Group> groups;

  DateTime projectstart = DateTime.now();
  DateTime registerEnd = DateTime.now();
  DateTime projectEnd = DateTime.now();

  // Init Data (avoid null Reference Exception)
  ProjectModel(
      {this.id = '',
      this.name = '',
      this.unitid = '',
      this.groups = const <Group>[],
      this.projectstart = null,
      this.registerEnd = null,
      this.projectEnd = null});

  // get object from json encoding
  factory ProjectModel.fromJson(Map<String, dynamic> parsedJson) {
    return new ProjectModel(
      id: parsedJson['id'] ?? '',
      name: parsedJson['name'] ?? '',
      unitid: parsedJson['unitid'] ?? '',
      groups: parsedJson['groups'] ?? const <Group>[],
      projectstart: parsedJson['projectstart'] ?? null,
      registerEnd: parsedJson['registerEnd'] ?? null,
      projectEnd: parsedJson['projectEnd'] ?? null,
    );
  }

  // Create an json encode version of the Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'unitid': this.unitid,
      'groups': this.groups,
      'projectstart': this.projectstart,
      'registerEnd': this.registerEnd,
      'projectEnd': this.projectEnd,
    };
  }
}
