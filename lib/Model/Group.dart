// Local Data
class Group {
  String group_name;

  String masterid;
  Map<String, bool> membersid; //boolean to know if user accept the invitation

  int maxnumberofmember;

  // Init Data (avoid null Reference Exception)
  Group(
      {this.group_name = '',
      this.masterid = '',
      this.membersid = const <String, bool>{},
      this.maxnumberofmember = 4});

  // get object from json encoding
  factory Group.fromJson(Map<String, dynamic> parsedJson) {
    return new Group(
        group_name: parsedJson['group_name'] ?? '',
        masterid: parsedJson['masterid'] ?? '',
        membersid: parsedJson['membersid'] ?? const <String, bool>{},
        maxnumberofmember: parsedJson['maxnumberofmember'] ?? 4);
  }

  // Create an json encode version of the Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'group_name': this.group_name,
      'masterid': this.masterid,
      'membersid': this.membersid,
      'maxnumberofmember': this.maxnumberofmember
    };
  }
}
