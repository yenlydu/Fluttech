import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/PopupDescription.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/ProjectsActions.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';


class DisplayHandleStudent extends StatefulWidget {
  ProjectInformation firstProject = new ProjectInformation(title: "First project", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", beginDate: DateTime(2021, 09, 28, 15, 30), endDate: DateTime(2023, 09, 28, 15, 30));
  ProjectInformation secondProject = new ProjectInformation(title: "Second project", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", beginDate: DateTime(2010, 03, 12, 09, 15), endDate: DateTime(2011, 03, 12, 13, 15));

  DisplayHandleStudent();

  @override
  _DisplayHandleStudentState createState() => _DisplayHandleStudentState();
}

class  _DisplayHandleStudentState extends State<DisplayHandleStudent>
{
  Widget displayTitle({String title})
  {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: TextStyle(color: Color(0xFF5D1EB5),fontSize: 22,fontWeight: FontWeight.bold, ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildingScrollView(context: context, child: displayItems(), width: 400, height: MediaQuery.of(context).size.height/4);

  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(Icons.assignment_turned_in_sharp, color: Colors.green, size: 100,),
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Allow'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Block'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }


  Widget singleItem(ProjectInformation project)
  {
      return  Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          children: [
            SizedBox(height:5),
            displayTitle(title: project.title),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //
                ActionButtonsStyle(color: Colors.red, text: "Unregister", customFunction: () => ProjectsActions(currrentProject: project,actions: ProjectActionsEnum.DELETE, ), icon: Icons.app_registration,),
                ActionButtonsStyle(color: Colors.orange, text: "Edit group",customFunction: () => ProjectsActions(currrentProject: project,actions: ProjectActionsEnum.EDIT_GROUP,), icon: Icons.group_rounded,),
                ActionButtonsStyle(color: Colors.orange, text: "Edit notes",customFunction: () => ProjectsActions(currrentProject: project,actions: ProjectActionsEnum.EDIT_NOTES,), icon: Icons.insert_drive_file_rounded,),
                //ActionButtonsStyle(color: Colors.green, text: "Add Student",customFunction: () => ProjectsActions(project: project,actions: ProjectActionsEnum.ADD_STUDENT,), icon: Icons.add,),
              ],
            ),
            SizedBox(height:5),
          ],
        ),

    );

  }

  Widget displayItems() {
    ProjectInformation firstProject = new ProjectInformation(
        title: "First project",
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        beginDate: DateTime(2021, 09, 28, 15, 30),
        endDate: DateTime(2023, 09, 28, 15, 30));
    ProjectInformation secondProject = new ProjectInformation(
        title: "Second project",
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        beginDate: DateTime(2010, 03, 12, 09, 15),
        endDate: DateTime(2011, 03, 12, 13, 15));

    return Padding(
        padding: EdgeInsets.all(5),
      child: Column(
          children: [
            SizedBox(height: 10),
            buildingSingleItemConstant(context: context,
                itemDisplay: singleItem(firstProject),
                onTapPopup: PopupDescription(project: new ProjectInformation(
                    title: "title",
                    description: "description",
                    beginDate: DateTime.now(),
                    endDate: DateTime.now()))),
            SizedBox(height: 10),

            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "1"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject), firebaseModuleId: "2"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "3"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject),firebaseModuleId: "4"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "5"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject),firebaseModuleId: "6"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "7"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject),firebaseModuleId: "8"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "9"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject),firebaseModuleId: "10"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "11"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject),firebaseModuleId: "12"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "13"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject),firebaseModuleId: "14"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "15"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject),firebaseModuleId: "16"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "17"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject),firebaseModuleId: "18"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "19"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject),firebaseModuleId: "20"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "21"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(firstProject),firebaseModuleId: "22"),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(secondProject),firebaseModuleId: "23"),
            SizedBox(height: 10),
          ],
    )
    );
  }

}