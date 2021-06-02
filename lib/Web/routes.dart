import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplayAllProjects.dart';
import 'package:flutter2/Web/Navigation/NavigationPages.dart';
import 'package:flutter2/Web/Login.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter2/Web/Navigation/HandleStudents/AllStudents.dart';
const String routeUsers = '/handleUsers';
const String initialRoute= '/';
const String routeUnits = '/handleUnits';


Widget test(String te)
{
  print(te);
  return Container(
    child: HandleProjects(),
  );
}

final navKey = new GlobalKey<NavigatorState>();
class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uri = Uri.parse(settings.name);
    if (uri.pathSegments.length == 2) {
      print("ROUTE zaer");

      var id = uri.pathSegments[1];
      return PageRouteBuilder
        (settings: settings, pageBuilder:  (_, __, ___) => test(id),     transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      );
    }

    switch (settings.name) {
      case routeUnits:
        print("ROUTE UNITS");
        return PageRouteBuilder(settings: settings, pageBuilder:  (_, __, ___) => AllProjects());
        break;
      case routeUsers:
        return PageRouteBuilder(settings: settings, pageBuilder:  (_, __, ___) => AllStudents());
        break;
    }
  }
}