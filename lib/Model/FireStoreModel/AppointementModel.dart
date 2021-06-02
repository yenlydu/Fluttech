// Local User Data
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointementModel {
  String id;
  String name;
  String room;

  String creatorUserName;
  String creatorUserid;
  String unitid;

  List<String> subscribedusersId;

  DateTime timetoAppoint = DateTime.now();

  // Init Data (avoid null Reference Exception)
  AppointementModel({
    this.id = '',
    this.name = '',
    this.room = '',
    this.creatorUserName = '',
    this.creatorUserid = '',
    this.unitid = '',
    this.subscribedusersId = const <String>[],
    this.timetoAppoint = null,
  });

  // get object from json encoding
  factory AppointementModel.fromJson(Map<String, dynamic> parsedJson) {
    return new AppointementModel(
      id: parsedJson['id'] ?? '',
      name: parsedJson['name'] ?? '',
      room: parsedJson['room'] ?? '',
      creatorUserName: parsedJson['creatorUserName'] ?? '',
      creatorUserid: parsedJson['creatorUserid'] ?? '',
      unitid: parsedJson['unitid'] ?? '',
      subscribedusersId:
          List.from(parsedJson['subscribedusersId']) ?? const <String>[],
      timetoAppoint: (parsedJson['timetoAppoint'] == null)
          ? DateTime.now()
          : (parsedJson['timetoAppoint'] as Timestamp).toDate() ?? null,
    );
  }

  // Create an json encode version of the Class (for Data saving)
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'room': this.room,
      'creatorUserName': this.creatorUserName,
      'creatorUserid': this.creatorUserid,
      'unitid': this.unitid,
      'timetoAppoint': this.timetoAppoint,
      'subscribedusersId': this.subscribedusersId,
    };
  }
}
