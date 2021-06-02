// Import the firebase_core and cloud_firestore plugn
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/FireStoreModel/Group.dart';
import 'package:flutter2/Model/FireStoreModel/UnitModel.dart';
import 'package:flutter2/Model/FireStoreModel/UserModel.dart';

//File Includ
import '../../../Model/FireStoreModel/ProjectModel.dart';
import 'FireStoreUser.dart';

// Manage User Info with Shared Preferences
class FireStoreProject {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference project =
      FirebaseFirestore.instance.collection('Projects');

  FireStoreProject() {}

  Future<ProjectModel> registerProject(ProjectModel data) async {
    try {
      var res = await project.add(data.toJson());
      var ress = await project.doc(res.id).update({'id': res.id});

      data.id = res.id;
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> UpdateProject(ProjectModel data) async {
    try {
      project.doc(data.id).update(data.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> UpdateProjectField(
      User fireUser, ProjectModel data, String field, String value) {
    project.doc(data.id).update({field: value});
  }

  Future<ProjectModel> getData(String documentId) async {
    try {
      DocumentSnapshot res = await project.doc(documentId).get();
      ProjectModel getproject = null;

      if (res != null && res.data() != null) {
        getproject = ProjectModel.fromJson(res.data());
      } else {
        return (null);
      }
      return getproject;
    } catch (e) {
      return null;
    }
  }

  bool deleteData(String documentId) {
    try {
      project.doc(documentId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<ProjectModel> createProject(
      UserModel creator,
      UnitModel unit,
      String name,
      DateTime projectstart,
      DateTime registerEnd,
      DateTime projectEnd) async {
    if (name.isNotEmpty) {
      ProjectModel newUnit = new ProjectModel(
          name: name,
          projectStart: projectstart,
          registerEnd: registerEnd,
          projectEnd: projectEnd,
          unitID: unit.id);
      var res = await registerProject(newUnit);
      return res;
    } else {
      return null;
    }
  }

  // Groups
  Future<List<Group>> getProjectGroups(ProjectModel projectdata) async {
    List<Group> groups = [];

    var res = await project.doc(projectdata.id).collection("groups").get();
    res.docs.forEach((result) {
      print(result.data());
      groups.add(Group.fromJson(result.data()));
    });

    await Future.delayed(Duration(milliseconds: 100));
    return groups;
  }

  Future<List<UserModel>> getProjectUsers(ProjectModel projectinfo) async {
    List<UserModel> users = [];

    projectinfo.usersID.forEach((result) async {
      var res = await locator<FireStoreUser>().getUser(result);
      users.add(res);
    });

    await Future.delayed(Duration(milliseconds: 100));
    return users;
  }

  //Subscribe to Unit
  Future<bool> subscribeToProject(ProjectModel project) async {
    try {
      project.usersID.add(locator<FireStoreUser>().currentUser.firebaseID);
      await UpdateProject(project);

      locator<FireStoreUser>().currentUser.subscribedProject.add(project.id);
      locator<FireStoreUser>().UpdateUser(locator<FireStoreUser>().currentUser);

      return true;
    } catch (e) {
      return false;
    }
  }

  //Unsaubscribe to Unit
  Future<bool> unsubscribeToProject(ProjectModel project) async {
    try {
      project.usersID.remove(locator<FireStoreUser>().currentUser.firebaseID);
      await UpdateProject(project);

      locator<FireStoreUser>().currentUser.subscribedProject.remove(project.id);
      locator<FireStoreUser>().UpdateUser(locator<FireStoreUser>().currentUser);

      return true;
    } catch (e) {
      return false;
    }
  }
}
