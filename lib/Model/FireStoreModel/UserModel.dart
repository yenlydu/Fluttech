// Local User Data
class UserModel {
  String firebaseID;

  String email;
  String firstName;
  String lastName;
  String phoneNumber;

  int gpa;
  int currentCredits;
  int maxAvailable;

  String role;
  //Map<String, String> authorization;

  List<String> subscribedProject;
  List<String> subscribedUnit;
  List<String> appointementList;

  // Init User Data (avoid null Reference Exception)
  UserModel({
    this.firebaseID = '',
    this.email = 'template@temp.tmp',
    this.firstName = 'Template',
    this.lastName = 'Temp',
    this.phoneNumber = '217 329 314',
    this.gpa = 0,
    this.currentCredits = 0,
    this.maxAvailable = 0,
    this.role = 'user',
    this.subscribedProject = const <String>[],
    this.subscribedUnit = const <String>[],
    this.appointementList = const <String>[],
  });

  // Get Combinaison of First Name & Last name of the user
  String fullName() {
    return '$firstName $lastName';
  }

  // get User object from json encoding
  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return new UserModel(
      firebaseID: parsedJson['firebaseID'] ?? '',
      email: parsedJson['email'] ?? '',
      firstName: parsedJson['firstName'] ?? '',
      lastName: parsedJson['lastName'] ?? '',
      phoneNumber: parsedJson['phoneNumber'] ?? '',
      gpa: parsedJson['gpa'] ?? 0,
      currentCredits: parsedJson['currentCredits'] ?? 0,
      maxAvailable: parsedJson['maxAvailable'] ?? 0,
      role: parsedJson['role'] ?? 'user',
      subscribedProject:
          List.from(parsedJson['subscribedProject']) ?? <String>[],
      subscribedUnit: List.from(parsedJson['subscribedUnit']) ?? <String>[],
      appointementList: List.from(parsedJson['appointementList']) ?? <String>[],
    );
  }

  // Create an json encode version of the User Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'firebaseID': this.firebaseID,
      'email': this.email,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'phoneNumber': this.phoneNumber,
      'gpa': this.gpa,
      'currentCredits': this.currentCredits,
      'maxAvailable': this.maxAvailable,
      'role': this.role,
      'subscribedProject': this.subscribedProject,
      'subscribedUnit': this.subscribedUnit,
      'appointementList': this.appointementList,
    };
  }
}
