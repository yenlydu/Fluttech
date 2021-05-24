import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// Manage User Info with Shared Preferences
class LocalPreferences {
  SharedPreferences sharedpref;

  init() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  // Get Locally Saved User Info
  bool IsRememberUser() {
    if (!sharedpref.containsKey("rememberme")) return false;

    var res = sharedpref.getBool("rememberme");

    return res;
  }
}
