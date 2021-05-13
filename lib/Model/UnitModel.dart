import 'dart:io';

// Local User Data
class UnitModel {
  String email;
  String firstName;
  String lastName;
  String fullname;

  // Init User Data (avoid null Reference Exception)
  UnitModel({
    this.email = '',
    this.firstName = '',
  });

  // Get Combinaison of First Name & Last name of the user
  String fullName() {
    return '$firstName $lastName';
  }

  // get User object from json encoding
  factory UnitModel.fromJson(Map<String, dynamic> parsedJson) {
    return new UnitModel(
      email: parsedJson['email'] ?? '',
      firstName: parsedJson['firstName'] ?? '',
    );
  }

  // Create an json encode version of the User Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'firstName': this.firstName,
      'lastName': this.lastName,
    };
  }
}
