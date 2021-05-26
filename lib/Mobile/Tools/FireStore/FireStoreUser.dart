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
      var res = await users.add(data.toJson());
      var ress = await users.doc(res.id).update({'id': res.id});

      data.userid = res.id;
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> UpdateUser(User fireUser, UserModel data) async {
    try {
      var res = await users.doc(fireUser.uid).update(data.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> UpdateUserField(User fireUser, UserModel data) async {
    try {
      var res = await users.doc(fireUser.uid).update(data.toJson());
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

    user.appointementlist.forEach((element) async {
      try {
        var res =
            await locator<FireStoreAppointement>().getAppointement(element);
        Aptmtlist.add(res);
      } catch (e) {
        print(e);
      }
    });

    return Aptmtlist;
  }

  Future<List<UnitModel>> getUserUnits(UserModel user) async {
    List<UnitModel> Unitlist = [];

    user.subscribeUnit.forEach((element) async {
      try {
        var firestoreunit = locator<FireStoreUnit>();
        var res = await firestoreunit.getData(element);
        Unitlist.add(res);
      } catch (e) {}
    });

    return Unitlist;
  }

  Future<List<ProjectModel>> getUserProjects(UserModel user) async {
    List<ProjectModel> Projectlist = [];

    user.subscribeProject.forEach((element) async {
      try {
        var firestoreproject = locator<FireStoreProject>();
        var res = await firestoreproject.getData(element);
        Projectlist.add(res);
      } catch (e) {}
    });

    return Projectlist;
  }
}
