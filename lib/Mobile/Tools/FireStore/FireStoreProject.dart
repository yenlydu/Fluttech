// Import the firebase_core and cloud_firestore plugn
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//File Includ
import '../../../Model/ProjectModel.dart';

// Manage User Info with Shared Preferences
class FireStoreProject {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference project;

  FireStoreProject() {
    project = FirebaseFirestore.instance.collection('project');
  }

  Future<ProjectModel> registerProject(User fireUser, ProjectModel data) async {
    try {
      var res = await project.add(data.toJson());
      var ress = await project.doc(res.id).update({'id': res.id});

      data.id = res.id;
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> UpdateProject(User fireUser, ProjectModel data) {
    project.doc(fireUser.uid).update(data.toJson());
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
}
