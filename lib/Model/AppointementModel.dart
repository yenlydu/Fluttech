import 'dart:io';

import 'package:flutter2/Model/ProjectModel.dart';

// Local User Data
class AppointementModel {
  String id;
  String name;
  String description;

  List<String> usersId;

  DateTime timetoAppoint = DateTime.now();

  // Init User Data (avoid null Reference Exception)
  AppointementModel({
    this.id = '',
    this.name = '',
    this.description = '',
    this.usersId = const <String>[],
    this.timetoAppoint = null,
  });

  // get object from json encoding
  factory AppointementModel.fromJson(Map<String, dynamic> parsedJson) {
    return new AppointementModel(
      id: parsedJson['id'] ?? '',
      name: parsedJson['name'] ?? '',
      description: parsedJson['description'] ?? '',
      timetoAppoint: parsedJson['timetoAppoint'] ?? '',
      usersId: parsedJson['usersId'] ?? '',
    );
  }

  // Create an json encode version of the Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'timetoAppoint': this.timetoAppoint,
      'usersId': this.usersId,
    };
  }
}
