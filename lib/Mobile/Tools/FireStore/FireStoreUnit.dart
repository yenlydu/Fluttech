import 'dart:io';
import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugn
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//File Includ
import '../../../Model/UnitModel.dart';

// Manage User Info with Shared Preferences
class FireStoreUnit {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users;

  FireStoreUnit() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
  }

  Future<bool> registerUser(User fireUser, UnitModel data) {
    var res = users.doc(fireUser.uid).set(data.toJson());
  }

  Future<bool> UpdateUser(User fireUser, UnitModel data) {
    users.doc(fireUser.uid).update(data.toJson());
  }

  Future<bool> UpdateUserField(User fireUser, UnitModel data) {}

  Future<UnitModel> getData(String documentId) async {
    DocumentSnapshot res = await users.doc(documentId).get();

    if (res.data() != null) {
      UnitModel user = UnitModel.fromJson(res.data());
    } else {
      return (null);
    }
  }

  bool deleteData(String documentId) {
    try {
      users.doc(documentId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
