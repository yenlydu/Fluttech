import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplaySingleProjectContent.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';


class HandleProjects extends StatefulWidget {
  const HandleProjects({Key key}) : super(key: key);

  @override
  _HandleProjectsState createState() => _HandleProjectsState();
}

class _HandleProjectsState extends State<HandleProjects> {
  Widget getProjectsInformation(BuildContext context) {
    ProjectInformation firstProject = new ProjectInformation(
        title: "First project",
        description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        beginDate: DateTime(2021, 09, 28, 15, 30),
        endDate: DateTime(2023, 09, 28, 15, 30));
    ProjectInformation secondProject = new ProjectInformation(
        title: "Second project",
        description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        beginDate: DateTime(2010, 03, 12, 09, 15),
        endDate: DateTime(2011, 03, 12, 13, 15));
    ProjectInformation thirdProject = new ProjectInformation(
        title: "Third project",
        description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        beginDate: DateTime(2010, 03, 12, 09, 15),
        endDate: DateTime(2011, 03, 12, 13, 15));
    return Column(
      children: [
        SizedBox(height:25),
        DisplayHandleProject(project: firstProject),
        SizedBox(height:25),
        DisplayHandleProject(project: secondProject,),
        SizedBox(height:25),
        DisplayHandleProject(project: thirdProject,),
        SizedBox(height:25),
        DisplayHandleProject(project: firstProject,),
        SizedBox(height:25),
        DisplayHandleProject(project: secondProject,),
        SizedBox(height:25),
        DisplayHandleProject(project: thirdProject,),
        SizedBox(height:25),
        DisplayHandleProject(project: firstProject, ),
        SizedBox(height:25),
        DisplayHandleProject(project: secondProject,),
        SizedBox(height:25),
        DisplayHandleProject(project: thirdProject, ),
        SizedBox(height:25),
        DisplayHandleProject(project: firstProject,),
        SizedBox(height:25),
        DisplayHandleProject(project: secondProject,),
        SizedBox(height:25),
        DisplayHandleProject(project: thirdProject, ),
        SizedBox(height:25),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildingScrollView(height: MediaQuery.of(context).size.height / 3/2, width: MediaQuery.of(context).size.width/1.5, context: context, child: getProjectsInformation(context));
  }
}

