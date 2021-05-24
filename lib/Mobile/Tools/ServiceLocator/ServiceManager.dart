import 'package:flutter2/Mobile/Tools/LocalTools.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

//File Include
import '../Image/ImageProfileFireManager.dart';
import '../authentication_service.dart';
import '../Image/ImagePickerManager.dart';
import '../FireStore/FireStoreUser.dart';
import '../FireStore/FireStoreUnit.dart';
import '../FireStore/FireStoreProject.dart';
import '../FireStore/FireStoreAppointements.dart';

final locator = GetIt.instance;

void setupServices() {
  //Auth Service
  locator.registerSingleton<AuthenticationService>(
      AuthenticationService(FirebaseAuth.instance));

  //Image Service
  locator.registerSingleton<ImageProfileFireManager>(ImageProfileFireManager());
  locator.registerSingleton<ImagePickerManager>(ImagePickerManager());

  //SharedPreference
  locator.registerSingleton<LocalPreferences>(LocalPreferences());

  //FireStore Service
  locator.registerSingleton<FireStoreUser>(FireStoreUser());
  locator.registerSingleton<FireStoreUnit>(FireStoreUnit());
  locator.registerSingleton<FireStoreProject>(FireStoreProject());
  locator.registerSingleton<FireStoreAppointement>(FireStoreAppointement());
}
