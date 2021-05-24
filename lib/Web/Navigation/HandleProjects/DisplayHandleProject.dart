import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/Actions/PopupDescription.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/Actions/ProjectsActions.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';


class DisplayHandleProject extends StatefulWidget {
  final ProjectInformation project;

  DisplayHandleProject({this.project});

  @override
  _DisplayHandleProjectState createState() => _DisplayHandleProjectState();
}

class  _DisplayHandleProjectState extends State<DisplayHandleProject>
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
    return singleItem(project: widget.project);
  }
  Widget singleItem({@required ProjectInformation project}) {

    return Center(
    child:InkWell(
      onTap: ()=> {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return PopupDescription(project: project,);
          })
      },
      child: Container(
      width: MediaQuery.of(context).size.width/1.6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF7F8F8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 2,
            offset: Offset(0.5,0.5),
            blurRadius: 2,
          )
        ]
      ),
      child : Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            displayTitle(title: project.title),
            sizedBox(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButtonsStyle(color: Colors.red, text: "Delete", customFunction: () => ProjectsActions(project: project,actions: ProjectActionsEnum.DELETE, ), icon: Icons.delete),
                ActionButtonsStyle(color: Colors.orange, text: "Edit",customFunction: () => ProjectsActions(project: project,actions: ProjectActionsEnum.EDIT,), icon: Icons.edit,),
                ActionButtonsStyle(color: Colors.green, text: "Add Student",customFunction: () => ProjectsActions(project: project,actions: ProjectActionsEnum.ADD_STUDENT,), icon: Icons.add,),
              ],
            ),
            sizedBox(5)
          ],
        ),
        ),
        ),
      ),
    );


  }

}