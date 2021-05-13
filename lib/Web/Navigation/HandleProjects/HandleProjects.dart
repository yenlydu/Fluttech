import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplayHandleProject.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
class HandleProjects
{
  Widget getProjectsInformation(BuildContext context)
  {
    ProjectInformation firstProject = new ProjectInformation(title: "First project", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", beginDate: DateTime(2021, 09, 28, 15, 30), endDate: DateTime(2102, 09, 28, 15, 30));
    ProjectInformation secondProject = new ProjectInformation(title: "Second project", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", beginDate: DateTime(1923, 03, 12, 09, 15), endDate: DateTime(2011, 03, 12, 13, 15));
    return Column(
      children: [
        Text(formatter(firstProject.endDate)),
        Text(formatter(secondProject.endDate)),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: secondProject),
        spaceBetweenWidgets,
        DisplayHandleProject().singleItem(context: context, project: firstProject),
        spaceBetweenWidgets,

      ],
    );
  }

  Widget constructProjectsList(double size, BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width/1.5,
      height: size,
      child: SingleChildScrollView(
        child: Column(
          children: [
            getProjectsInformation(context),
          ],
        ),
      ),
    );
  }
}