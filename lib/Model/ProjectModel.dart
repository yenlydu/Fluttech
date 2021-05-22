import 'Group.dart';

// Local Data
class ProjectModel {
  String id;
  String name;

  List<String> teachers;
  List<Group> groups;

  // Init Data (avoid null Reference Exception)
  ProjectModel(
      {this.id = '',
      this.name = '',
      this.teachers = const <String>[],
      this.groups = const <Group>[]});

  // get object from json encoding
  factory ProjectModel.fromJson(Map<String, dynamic> parsedJson) {
    return new ProjectModel(
        id: parsedJson['id'] ?? '',
        name: parsedJson['name'] ?? '',
        teachers: parsedJson['teachers'] ?? const <String>[],
        groups: parsedJson['groups'] ?? const <Group>[]);
  }

  // Create an json encode version of the Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'teachers': this.teachers,
      'groups': this.groups
    };
  }
}
