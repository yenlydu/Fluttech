// Import the firebase_core and cloud_firestore plugn
import 'package:cloud_firestore/cloud_firestore.dart';

//File Includ
import '../../../Model/UnitModel.dart';
import '../../../Model/UserModel.dart';

// Manage Unit Info with Shared Preferences
class FireStoreUnit {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference units;

  FireStoreUnit() {
    CollectionReference units = FirebaseFirestore.instance.collection('Unit');
  }

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
    DocumentSnapshot res = await units.doc(documentId).get();

    if (res.data() != null) {
      UnitModel Unit = UnitModel.fromJson(res.data());
    } else {
      return (null);
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

  //Subscribe to Unit
  bool subscribeToUnit(UserModel usertosub, UnitModel unit) {
    try {
      unit.usersId.add(usertosub.userid);
      UpdateUnit(unit);
      return true;
    } catch (e) {
      return false;
    }
  }

  //Create Project
  //Create Appointement
}
