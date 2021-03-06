// Import the firebase_core and cloud_firestore plugn
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/FireStoreModel/AppointementModel.dart';
import 'package:flutter2/Model/FireStoreModel/UnitModel.dart';

//File Includ
import '../../../Model/FireStoreModel/AppointementModel.dart';
import '../../../Model/FireStoreModel/UserModel.dart';
import 'FireStoreUser.dart';

// Manage Unit Info with Shared Preferences
class FireStoreAppointement {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference appointement =
      FirebaseFirestore.instance.collection('Appointement');

  FireStoreAppointement() {}

  Future<AppointementModel> registerAppointement(AppointementModel data) async {
    try {
      var res = await appointement.add(data.toJson());
      var ress = await appointement.doc(res.id).update({'id': res.id});

      data.id = res.id;
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> UpdateAppointement(AppointementModel data) {
    appointement.doc(data.id).update(data.toJson());
  }

  Future<bool> UpdateAppointementField(
      AppointementModel appoint, String field, String value) {
    appointement.doc(appoint.id).update({field: value});
  }

  Future<AppointementModel> getAppointement(String documentId) async {
    try {
      DocumentSnapshot res = await appointement.doc(documentId).get();
      AppointementModel appoint = null;

      if (res != null && res.data() != null) {
        appoint = AppointementModel.fromJson(res.data());
      } else {
        return (null);
      }
      return appoint;
    } catch (e) {
      return null;
    }
  }

  bool deleteData(String documentId) {
    try {
      appointement.doc(documentId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<AppointementModel> createAppointement(UserModel creator,
      UnitModel unit, String name, String room, DateTime timetoAppoint) async {
    if (name.isNotEmpty) {
      AppointementModel newUnit = new AppointementModel(
        name: name,
        room: room,
        creatorUserName: creator.email,
        creatorUserid: creator.firebaseID,
        unitid: unit.id,
        timetoAppoint: timetoAppoint,
      );

      await registerAppointement(newUnit);

      return newUnit;
    } else {
      return null;
    }
  }

  Future<bool> subscribeToAppointement(AppointementModel appointement) async {
    try {
      appointement.subscribedusersId
          .add(locator<FireStoreUser>().currentUser.firebaseID);
      this.UpdateAppointement(appointement);

      locator<FireStoreUser>()
          .currentUser
          .appointementList
          .add(appointement.id);
      locator<FireStoreUser>().UpdateUser(locator<FireStoreUser>().currentUser);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> unsubscribeToAppointement(AppointementModel appointement) async {
    try {
      appointement.subscribedusersId
          .remove(locator<FireStoreUser>().currentUser.firebaseID);
      this.UpdateAppointement(appointement);

      locator<FireStoreUser>()
          .currentUser
          .appointementList
          .remove(appointement.id);
      locator<FireStoreUser>().UpdateUser(locator<FireStoreUser>().currentUser);

      return true;
    } catch (e) {
      return false;
    }
  }
}
