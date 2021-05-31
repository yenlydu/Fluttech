import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/PopupDescription.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/ConstructStudentsProjectContent.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';

class DisplayHandleStudent extends StatefulWidget {
  DisplayHandleStudent();

  @override
  _DisplayHandleStudentState createState() => _DisplayHandleStudentState();
}

class  _DisplayHandleStudentState extends State<DisplayHandleStudent>
{
  ProjectInformation firstProject = new ProjectInformation(
      name: "First project",
      teammates: [new Teammates(mail: "21@gmail", image: Icon(Icons.face, color: Colors.green,), ), new Teammates(mail: "22@gmail", image: Icon(Icons.settings, color: Colors.red,)), new Teammates(mail: "23@gmail", image: Icon(Icons.tab, color: Colors.teal,), )],
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      projectStart: DateTime(2021, 09, 28, 15, 30),
      projectEnd: DateTime(2023, 09, 28, 15, 30));
  ProjectInformation secondProject = new ProjectInformation(
      name: "Second project",
      teammates: [new Teammates(mail: "21@gmail", image: Icon(Icons.face, color: Colors.green,), ), new Teammates(mail: "22@gmail", image: Icon(Icons.settings, color: Colors.red,)), new Teammates(mail: "23@gmail", image: Icon(Icons.tab, color: Colors.teal,), )],
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      projectStart: DateTime(2010, 03, 12, 09, 15),
      projectEnd: DateTime(2011, 03, 12, 13, 15));

  @override
  Widget build(BuildContext context) {

    return buildingScrollView(context: context, child: displayItems(), width: 400, height: MediaQuery.of(context).size.height/4);

  }
  Widget displayItems() {
    return Padding(
        padding: EdgeInsets.all(5),
      child: Column(
          children: [
            SizedBox(height: 10),
            buildingSingleItemConstant(context: context,
                itemDisplay: singleItem(project: firstProject),
                onTapPopup: PopupDescription(project: new ProjectInformation(
                    name: "title",
                    teammates: [new Teammates(mail: "31@gmail", image: Icon(Icons.face, color: Colors.green,), ), new Teammates(mail: "32@gmail", image: Icon(Icons.settings, color: Colors.red,)), new Teammates(mail: "33@gmail", image: Icon(Icons.tab, color: Colors.teal,), )],

                    description: "description",
                    projectStart: DateTime.now(),
                    projectEnd: DateTime.now()),projectEnum: ProjectActionsEnum.STUDENT_DESCRIPTION, )),
            SizedBox(height: 10),
            //MAXIME : firebasemodule id correspond a l'id dans firebase(la route : handleUnits/firebaseModuleId)
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: secondProject,)),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: firstProject, ), ),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: secondProject,),),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: firstProject,),),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: secondProject ,)),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: firstProject, ),),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: secondProject,)),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: firstProject, ),),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: secondProject,),),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: firstProject,),),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: secondProject, ),),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: firstProject,),),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: secondProject,),),
            SizedBox(height: 10),
            buildingSingleItemConstant(
                context: context, itemDisplay: singleItem(project: firstProject,)),
          ],
    )
    );
  }

}