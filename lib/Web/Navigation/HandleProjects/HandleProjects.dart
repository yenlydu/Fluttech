import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplayHandleProject.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';

class HandleProjects
{
  Widget getProjectsInformation(BuildContext context)
  {

    ProjectInformation firstProject = new ProjectInformation(title: "First project", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", beginDate: "2019", endDate: "2019");
    ProjectInformation secondProject = new ProjectInformation(title: "Second project", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", beginDate: "1233", endDate: "23");
    return Column(
      children: [
        SizedBox(
          height: 15.0,
        ),
        DisplayHandleProject().singleItem(context: context, title: firstProject.title, description: firstProject.description,icon: null),
        SizedBox(
          height: 15.0,
        ),
        DisplayHandleProject().singleItem(context: context, title: secondProject.title, description: secondProject.description,icon: Icons.description_outlined, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),            DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ), DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ), DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Total Bookings", description: "28,345",icon: null),
        SizedBox(
          height: 15.0,
        ),DisplayHandleProject().singleItem(context: context, title: "Partial Bookings", description: "34,1",icon: Icons.lock, iconColor: Colors.orangeAccent ),
        SizedBox(
          height: 15.0,
        ),
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