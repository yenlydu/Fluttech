import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplayAllProjects.dart';
import 'package:flutter2/Web/Navigation/NavigationPages.dart';
import 'package:flutter2/Web/Login.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/homeAdmin.dart';

const String routeUsers = '/handleUsers';
const String initialRoute= '/';
const String routeUnits = '/handleUnits';

List <UnitInformation> units;

Widget test(String te)
{
  return Container(
    child: HandleProjects(),
  );
}
void getUnits(List<UnitInformation> tempUnits)
{
  print("tempUnits[1].name");
  print(tempUnits[1].name);
  units = tempUnits;
}

final navKey = new GlobalKey<NavigatorState>();
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uri = Uri.parse(settings.name);
    if (uri.pathSegments.length == 2) {
      var id = uri.pathSegments[1];
      return PageRouteBuilder
        (settings: settings, pageBuilder:  (_, __, ___) => test(settings.name),     transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      );
    }

    switch (settings.name) {
      case routeUnits:
        return PageRouteBuilder(settings: settings, pageBuilder:  (_, __, ___) => AllProjects(getUnits: getUnits,));
        break;
      case routeUsers:
        return PageRouteBuilder(settings: settings, pageBuilder:  (_, __, ___) => AllStudents());
        break;
    }
  }
}