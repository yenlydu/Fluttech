import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplaySingleProjectContent.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/HandleUnits/DisplayHandleUnits.dart';
class HandleUnits {
  Widget getProjectsInformation(BuildContext context) {
    ProjectInformation firstUnit = new ProjectInformation(
        title: "First Module",
        description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        beginDate: DateTime(2021, 09, 28, 15, 30),
        endDate: DateTime(2023, 09, 28, 15, 30));
    ProjectInformation secondUnit = new ProjectInformation(
        title: "Second Module",
        description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        beginDate: DateTime(2010, 03, 12, 09, 15),
        endDate: DateTime(2011, 03, 12, 13, 15));
    ProjectInformation thirdUnit = new ProjectInformation(
        title: "Third Module",
        description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        beginDate: DateTime(2010, 03, 12, 09, 15),
        endDate: DateTime(2011, 03, 12, 13, 15));
    return Column(
      children: [
        SizedBox(height:25),
        DisplayHandleUnits(project: firstUnit, unitsId: "1",),
        SizedBox(height:25),
        DisplayHandleUnits(project: secondUnit, unitsId: "2",),
        SizedBox(height:25),
        DisplayHandleUnits(project: thirdUnit, unitsId: "3",),
        SizedBox(height:25),
        DisplayHandleUnits(project: firstUnit, unitsId: "4",),
        SizedBox(height:25),
        DisplayHandleUnits(project: secondUnit, unitsId: "5",),
        SizedBox(height:25),
        DisplayHandleUnits(project: thirdUnit, unitsId: "6",),
        SizedBox(height:25),
        DisplayHandleUnits(project: firstUnit, unitsId: "7",),
        SizedBox(height:25),
        DisplayHandleUnits(project: secondUnit, unitsId: "8",),
        SizedBox(height:25),
        DisplayHandleUnits(project: thirdUnit, unitsId: "9",),
        SizedBox(height:25),
        DisplayHandleUnits(project: firstUnit, unitsId: "10",),
        SizedBox(height:25),
        DisplayHandleUnits(project: secondUnit, unitsId: "11",),
        SizedBox(height:25),
        DisplayHandleUnits(project: thirdUnit, unitsId: "12",),
        SizedBox(height:25),
      ],
    );
  }

  Widget constructProjectsList(double size, BuildContext context)
  {
    return buildingScrollView(height: size, width: MediaQuery.of(context).size.width/1.5, context: context, child: getProjectsInformation(context));
  }
}
