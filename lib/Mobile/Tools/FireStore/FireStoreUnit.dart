// Import the firebase_core and cloud_firestore plugn
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Mobile/Tools/authentication_service.dart';
import 'package:flutter2/Model/AppointementModel.dart';
import 'package:flutter2/Model/ProjectModel.dart';

//File Includ
import '../../../Model/UnitModel.dart';
import '../../../Model/UserModel.dart';
import 'FireStoreAppointements.dart';
import 'FireStoreProject.dart';
import 'FireStoreUser.dart';

// Manage Unit Info with Shared Preferences
class FireStoreUnit {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference units = FirebaseFirestore.instance.collection('Unit');

  FireStoreUnit() {}

  Future<UnitModel> registerUnit(UnitModel data) async {
    try {
      var res = await units.add(data.toJson());
      var ress = await units.doc(res.id).update({'id': res.id});

      data.id = res.id;
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> UpdateUnit(UnitModel data) async {
    try {
      units.doc(data.id).update(data.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> UpdateUnitField(
      UnitModel fireUnit, String field, String value) async {
    try {
      await units.doc(fireUnit.id).update({field: value});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UnitModel> getData(String documentId) async {
    try {
      DocumentSnapshot res = await units.doc(documentId).get();
      UnitModel Unit = null;

      if (res != null && res.data() != null) {
        Unit = UnitModel.fromJson(res.data());
      } else {
        return (null);
      }
      return Unit;
    } catch (e) {
      return null;
    }
  }

  bool deleteData(String documentId) {
    try {
      units.doc(documentId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UnitModel> createUnit(
    UserModel user,
    String name,
    String description,
    int creditAvailable,
    DateTime unitStart,
    DateTime registerEnd,
    DateTime unitEnd,
  ) async {
    if (name.isNotEmpty &&
        creditAvailable >= 0 &&
        (unitStart.millisecondsSinceEpoch <
                registerEnd.millisecondsSinceEpoch &&
            unitStart.millisecondsSinceEpoch <
                unitEnd.millisecondsSinceEpoch)) {
      description = (description.isEmpty)
          ? "Unit : " + name + "Start at : " + unitStart.toString()
          : description;

      UnitModel newUnit = new UnitModel(
        name: name,
        description: description,
        usercreatorID: user.userid,
        usercreatorName: user.firstName,
        creditAvailable: creditAvailable,
        unitStart: unitStart,
        registerEnd: registerEnd,
        unitEnd: unitEnd,
      );

      newUnit = await this.registerUnit(newUnit);

      return newUnit;
    } else {
      return null;
    }
  }

  //Get all unit
  Future<List<UnitModel>> getallunit() async {
    List<UnitModel> unitlist = [];
    QuerySnapshot querySnapshot = await units.get();

    unitlist = querySnapshot.docs
        .map((doc) => UnitModel.fromJson(doc.data()))
        .toList();

    await Future.delayed(Duration(milliseconds: 100));
    return unitlist;
  }

  //Subscribe to Unit
  Future<bool> subscribeToUnit(UnitModel unit) async {
    try {
      unit.usersId.add(locator<FireStoreUser>().currentUser.userid);
      await UpdateUnit(unit);

      locator<FireStoreUser>().currentUser.subscribeUnit.add(unit.id);
      locator<FireStoreUser>().UpdateUser(locator<FireStoreUser>().currentUser);

      return true;
    } catch (e) {
      return false;
    }
  }

  //Unsaubscribe to Unit
  Future<bool> unsubscribeToUnit(UnitModel unit) async {
    try {
      unit.usersId.remove(locator<FireStoreUser>().currentUser.userid);
      await UpdateUnit(unit);

      locator<FireStoreUser>().currentUser.subscribeUnit.remove(unit.id);
      locator<FireStoreUser>().UpdateUser(locator<FireStoreUser>().currentUser);

      return true;
    } catch (e) {
      return false;
    }
  }

  //Create Project
  Future<ProjectModel> createProject(
      UserModel creator,
      UnitModel unit,
      String name,
      DateTime projectstart,
      DateTime registerEnd,
      DateTime projectEnd) async {
    try {
      var res = await locator<FireStoreProject>().createProject(
          creator, unit, name, projectstart, registerEnd, projectEnd);

      unit.projectlist.add(res.id);
      await this.UpdateUnit(unit);
      return res;
    } catch (e) {
      return null;
    }
  }

  //Create Appointement
  Future<AppointementModel> createAppointement(UserModel creator,
      UnitModel unit, String name, String room, DateTime timetoAppoint) async {
    try {
      var res = await locator<FireStoreAppointement>()
          .createAppointement(creator, unit, name, room, timetoAppoint);
      unit.appointementlist.add(res.id);
      await this.UpdateUnit(unit);
      return res;
    } catch (e) {
      return null;
    }
  }

  //Get list of project

  Future<List<ProjectModel>> getUnitProject(UnitModel unit) async {
    try {
      List<ProjectModel> Projectlist = [];

      unit.projectlist.forEach((element) async {
        var res = await locator<FireStoreProject>().getData(element);
        Projectlist.add(res);
      });

      await Future.delayed(Duration(milliseconds: 100));
      return Projectlist;
    } catch (e) {
      return null;
    }
  }
  //Get list of appointement

  Future<List<AppointementModel>> getUnitAppointement(UnitModel unit) async {
    List<AppointementModel> Aptmtlist = [];

    unit.appointementlist.forEach((element) async {
      var res = await locator<FireStoreAppointement>().getAppointement(element);
      Aptmtlist.add(res);
    });

    await Future.delayed(Duration(milliseconds: 100));
    return Aptmtlist;
  }
}
