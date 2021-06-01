// Import the firebase_core and cloud_firestore plugn

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/ProjectModel.dart';
import 'package:flutter2/Model/UnitModel.dart';
import '../ServiceLocator/ServiceManager.dart';

//File Includ
import '../../../Model/UserModel.dart';
import '../../../Model/AppointementModel.dart';
import 'FireStoreAppointements.dart';
import 'FireStoreProject.dart';
import 'FireStoreUnit.dart';

// Manage User Info with Shared Preferences
class FireStoreUser {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('User');

  UserModel currentUser = new UserModel();

  FireStoreUser() {}

  Future<UserModel> registerUser(User fireUser, UserModel data) async {
    try {
      data.firebaseid = fireUser.uid;
      var res = await users.doc(fireUser.uid).set(data.toJson());
      //var ress = await users.doc(res.id).update({'id': res.id});

      return data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> UpdateUser(UserModel data) async {
    try {
      var res = await users.doc(data.firebaseid).update(data.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> UpdateUserField(UserModel data) async {
    try {
      var res = await users.doc(data.firebaseid).update(data.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel> getUser(String documentId) async {
    DocumentSnapshot res = await users.doc(documentId).get();
    UserModel user = null;
    if (res.data() != null) {
      user = UserModel.fromJson(res.data());
    } else {
      return (null);
    }
    return (user);
  }

  Future<bool> deleteData(String documentId) async {
    try {
      await users.doc(documentId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<AppointementModel>> getUserAppointements(UserModel user) async {
    List<AppointementModel> Aptmtlist = [];

    await user.appointementlist.forEach((element) async {
      var res = await locator<FireStoreAppointement>().getAppointement(element);
      Aptmtlist.add(res);
    });

    await Future.delayed(Duration(milliseconds: 100));
    return Aptmtlist;
  }

  Future<List<UnitModel>> getUserUnits(UserModel user) async {
    List<UnitModel> Unitlist = [];

    await user.subscribeUnit.forEach((element) async {
      var res = await locator<FireStoreUnit>().getData(element);
      Unitlist.add(res);
    });
    await Future.delayed(Duration(milliseconds: 100));
    return Unitlist;
  }

  Future<List<ProjectModel>> getUserProjects(UserModel user) async {
    try {
      List<ProjectModel> Projectlist = [];

      user.subscribeProject.forEach((element) async {
        var res = await locator<FireStoreProject>().getData(element);
        Projectlist.add(res);
      });

      await Future.delayed(Duration(milliseconds: 100));
      return Projectlist;
    } catch (e) {
      return null;
    }
  }
}
