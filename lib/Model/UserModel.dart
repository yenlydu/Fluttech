// Local User Data
class UserModel {
  String userid;
  String firebaseid;

  String email;
  String firstName;
  String lastName;
  String phoneNumber;

  int gpa;
  int currentCredits;
  int maxAvailable;

  String role;
  //Map<String, String> authorization;

  List<String> subscribeProject;
  List<String> subscribeUnit;
  List<String> appointementlist;

  // Init User Data (avoid null Reference Exception)
  UserModel({
    this.userid = '',
    this.firebaseid = '',
    this.email = 'template@temp.tmp',
    this.firstName = 'Template',
    this.lastName = 'Temp',
    this.phoneNumber = '217 329 314',
    this.gpa = 0,
    this.currentCredits = 0,
    this.maxAvailable = 0,
    this.role = 'user',
    this.subscribeProject = const <String>[],
    this.subscribeUnit = const <String>[],
    this.appointementlist = const <String>[],
  });

  // Get Combinaison of First Name & Last name of the user
  String fullName() {
    return '$firstName $lastName';
  }

  // get User object from json encoding
  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return new UserModel(
      userid: parsedJson['userid'] ?? '',
      firebaseid: parsedJson['firebaseid'] ?? '',
      email: parsedJson['email'] ?? '',
      firstName: parsedJson['firstName'] ?? '',
      lastName: parsedJson['lastName'] ?? '',
      phoneNumber: parsedJson['phoneNumber'] ?? '',
      gpa: parsedJson['gpa'] ?? 0,
      currentCredits: parsedJson['currentCredits'] ?? 0,
      maxAvailable: parsedJson['maxAvailable'] ?? 0,
      role: parsedJson['role'] ?? 'user',
      subscribeProject: List.from(parsedJson['subscribeProject']) ?? <String>[],
      subscribeUnit: List.from(parsedJson['subscribeUnit']) ?? <String>[],
      appointementlist: List.from(parsedJson['appointementlist']) ?? <String>[],
    );
  }

  // Create an json encode version of the User Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'userid': this.userid,
      'firebaseid': this.firebaseid,
      'email': this.email,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'phoneNumber': this.phoneNumber,
      'gpa': this.gpa,
      'currentCredits': this.currentCredits,
      'maxAvailable': this.maxAvailable,
      'role': this.role,
      'subscribeProject': this.subscribeProject,
      'subscribeUnit': this.subscribeUnit,
      'appointementlist': this.appointementlist,
    };
  }
}
