import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter2/Mobile/Tools/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

//File Includ

// Manage User Info with Shared Preferences
class ImageProfileFireManager {
  FirebaseStorage storage = FirebaseStorage.instance;

  ImageProfileFireManager();

  // Get Saved User Image
  Future<String> getUserPhoto() async {
    var user = FirebaseAuth.instance.currentUser;

    if (user == null || user.uid == null) {
      return null;
    }
    var storef = storage.ref("user/profile/" + user.uid);
    try {
      return await storef.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  // Set User Image
  Future<String> uploadPhoto(File file) async {
    var user = FirebaseAuth.instance.currentUser;

    var storef = storage.ref().child("user/profile/${user.uid}");
    var uploadtask = storef.putFile(file);
    var completedtask = uploadtask.snapshot;
    String downloadurl = await completedtask.ref.getDownloadURL();
    return downloadurl;
  }

  // Get Saved User Image
  Future<String> getOtherUserPhoto(String userid) async {
    var storef = storage.ref().child("user/profile/" + userid);
    return await storef.getDownloadURL();
  }
}
