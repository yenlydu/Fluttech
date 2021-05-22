import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/PopupDescription.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/ProjectsActions.dart';
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
    return buildingSingleItemConstant(context: context, itemDisplay: item(widget.project), onTapPopup: PopupDescription(project: widget.project));
  }

  void setProjectEdited(ProjectInformation pr)
  {
    setState(() {
//      widget.project = pr;
    });
  }

  Widget item(ProjectInformation project)
  {
    return Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          SizedBox(height:5),
          displayTitle(title: project.title),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionButtonsStyle(color: Colors.red, text: "Delete", customFunction: () => ProjectsActions(currrentProject: project,actions: ProjectActionsEnum.DELETE, ), icon: Icons.delete),
              ActionButtonsStyle(color: Colors.orange, text: "Edit",customFunction: () => ProjectsActions(currrentProject: project,actions: ProjectActionsEnum.EDIT,), icon: Icons.edit,setProjectEdited: setProjectEdited),
              ActionButtonsStyle(color: Colors.indigoAccent, text: "Add Meetings",customFunction: () => ProjectsActions(currrentProject: project,actions: ProjectActionsEnum.MEETINGS,), icon: Icons.access_time,),
            ],
          ),
          SizedBox(height:5),
        ],
      ),
    );
  }
}

