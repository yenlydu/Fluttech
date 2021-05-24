// Import the firebase_core and cloud_firestore plugn
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter2/Model/UnitModel.dart';
import 'package:flutter2/Model/UserModel.dart';

//File Includ
import '../../../Model/ProjectModel.dart';

// Manage User Info with Shared Preferences
class FireStoreProject {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference project;

  FireStoreProject() {
    project = FirebaseFirestore.instance.collection('Project');
  }

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
      await project.doc(data.id).update(data.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> UpdateProjectField(User fireUser, ProjectModel data) {}

  Future<ProjectModel> getData(String documentId) async {
    DocumentSnapshot res = await project.doc(documentId).get();

    if (res.data() != null) {
      ProjectModel user = ProjectModel.fromJson(res.data());
    } else {
      return (null);
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
      String room,
      DateTime projectstart,
      DateTime registerEnd,
      DateTime projectEnd) async {
    if (name.isNotEmpty &&
        (projectstart.millisecondsSinceEpoch <
                registerEnd.millisecondsSinceEpoch &&
            projectstart.millisecondsSinceEpoch <
                projectEnd.millisecondsSinceEpoch) &&
        (projectstart.millisecondsSinceEpoch >=
                unit.unitStart.millisecondsSinceEpoch &&
            projectEnd.millisecondsSinceEpoch <=
                unit.unitEnd.millisecondsSinceEpoch)) {
      ProjectModel newUnit = new ProjectModel(
          name: name,
          projectstart: projectstart,
          projectEnd: projectEnd,
          unitid: unit.id);
      var res = await registerProject(newUnit);
      return res;
    } else {
      return null;
    }
  }
}
