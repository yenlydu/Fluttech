import 'dart:io';

import 'package:flutter2/Model/AppointementModel.dart';
import 'package:flutter2/Model/ProjectModel.dart';
import 'package:flutter2/Model/UnitModel.dart';

// Local User Data
class UserModel {
  String userid;
  String firebaseid;

  String email;
  String firstName;
  String lastName;
  String phoneNumber;

  double gpa;
  int currentCredits;
  int maxAvailable;

  List<ProjectModel> subscribeProject;
  List<UnitModel> subscribeUnit;
  List<AppointementModel> appointementlist;

  // Init User Data (avoid null Reference Exception)
  UserModel({
    this.userid = '',
    this.firebaseid = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    lastOnlineTimestamp,
    this.gpa = 0.0,
    this.currentCredits = 0,
    this.maxAvailable = 0,
    this.subscribeProject = const <ProjectModel>[],
  });

  // Get Combinaison of First Name & Last name of the user
  String fullName() {
    return '$firstName $lastName';
  }

  // get User object from json encoding
  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return new UserModel(
      email: parsedJson['email'] ?? '',
      firstName: parsedJson['firstName'] ?? '',
      lastName: parsedJson['lastName'] ?? '',
    );
  }

  // Create an json encode version of the User Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'phoneNumber': this.phoneNumber
    };
  }
}
