import 'dart:io';

// Local User Data
class ProjectModel {
  String email;
  String firstName;
  String lastName;

  String phoneNumber;

  bool active;

  String userID;

  //Profil Image
  String profilePictureURL;
  String facebookprofilePictureURL;
  String twitterprofilePictureURL;
  String linkedin_profilePictureURL;

  //Social Network Access & Refresh Token (if exist and user connect to the corresponding social network)
  String facebookaccesstoken;
  String facebookrefreshtoken;

  String twitteraccesstoken;
  String twitterrefreshtoken;

  String linkedin_accesstoken;
  String linkedin_refreshtoken;

  bool selected;

  String appIdentifier;

  // Init User Data (avoid null Reference Exception)
  ProjectModel(
      {this.email = '',
      this.firstName = '',
      this.phoneNumber = '',
      this.lastName = '',
      this.active = false,
      this.selected = false,
      lastOnlineTimestamp,
      this.userID = '',
      this.facebookaccesstoken = '',
      this.facebookrefreshtoken = '',
      this.twitteraccesstoken = '',
      this.twitterrefreshtoken = '',
      this.linkedin_accesstoken = '',
      this.linkedin_refreshtoken = '',
      this.facebookprofilePictureURL = '',
      this.twitterprofilePictureURL = '',
      this.profilePictureURL = ''})
      : this.appIdentifier = 'Flutter Login Screen ${Platform.operatingSystem}';

  // Get Combinaison of First Name & Last name of the user
  String fullName() {
    return '$firstName $lastName';
  }

  // get User object from json encoding
  factory ProjectModel.fromJson(Map<String, dynamic> parsedJson) {
    return new ProjectModel(
        email: parsedJson['email'] ?? '',
        firstName: parsedJson['firstName'] ?? '',
        lastName: parsedJson['lastName'] ?? '',
        active: parsedJson['active'] ?? false,
        facebookaccesstoken: parsedJson['facebookaccesstoken'] ?? '',
        twitteraccesstoken: parsedJson['twitteraccesstoken'] ?? '',
        linkedin_accesstoken: parsedJson['linkedin_accesstoken'] ?? '',
        facebookprofilePictureURL:
            parsedJson['facebookprofilePictureURL'] ?? '',
        twitterprofilePictureURL: parsedJson['twitterprofilePictureURL'] ?? '',
        phoneNumber: parsedJson['phoneNumber'] ?? '',
        userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
        profilePictureURL: parsedJson['profilePictureURL'] ?? '');
  }

  // Create an json encode version of the User Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'phoneNumber': this.phoneNumber,
      'id': this.userID,
      'facebookaccesstoken': this.facebookaccesstoken,
      'twitteraccesstoken': this.twitteraccesstoken,
      'linkedin_accesstoken': this.linkedin_accesstoken,
      'facebookprofilePictureURL': this.facebookprofilePictureURL,
      'twitterprofilePictureURL': this.twitterprofilePictureURL,
      'active': this.active,
      'profilePictureURL': this.profilePictureURL,
      'appIdentifier': this.appIdentifier
    };
  }
}
