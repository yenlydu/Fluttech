import 'dart:io';
import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugn
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//File Includ
import '../../../Model/UserModel.dart';

// Manage User Info with Shared Preferences
class FireStoreUser {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users;

  FireStoreUser() {
    CollectionReference users = FirebaseFirestore.instance.collection('User');
  }

  Future<bool> registerUser(User fireUser, UserModel data) {
    var res = users.doc(fireUser.uid).set(data.toJson());
  }

  Future<bool> UpdateUser(User fireUser, UserModel data) {
    users.doc(fireUser.uid).update(data.toJson());
  }

  Future<bool> UpdateUserField(User fireUser, UserModel data) {}

  Future<UserModel> getData(String documentId) async {
    DocumentSnapshot res = await users.doc(documentId).get();

    if (res.data() != null) {
      UserModel user = UserModel.fromJson(res.data());
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
