import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplaySingleProjectContent.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/HandleUnits/DisplayHandleUnits.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
class HandleUnits {

  final List<UnitInformation> unitInformation;
  HandleUnits({this.unitInformation});

  Widget getProjectsInformation(BuildContext context) {
      return Container(
          height: MediaQuery.of(context).size.height/1.3,
          child: ListView.builder(

            itemCount: unitInformation.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title:Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 25,),
                      DisplayHandleUnits(unit: unitInformation[index], unitsId: unitInformation[index].unitID,),

                    ],
                  )
              );
            },
          )
      );

  }

  Widget constructProjectsList(double size, BuildContext context)
  {
    if(!ResponsiveLayout.isSmallScreen(context)) {
      return buildingScrollView(height: MediaQuery.of(context).size.height/1.3, width: MediaQuery.of(context).size.width/1.5, context: context, child: getProjectsInformation(context));

    } else
      return buildingScrollView(height: MediaQuery.of(context).size.height/1.2, width: MediaQuery.of(context).size.width, context: context, child: getProjectsInformation(context));

  }
}
