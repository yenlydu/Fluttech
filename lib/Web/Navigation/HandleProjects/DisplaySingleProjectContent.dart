import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/PopupDescription.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/ProjectsActions.dart';
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
    return buildingSingleItemConstant(context: context, itemDisplay: item(widget.project), onTapPopup: PopupDescription(project: widget.project,));
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
          displayTitle(title: project.name),
          SizedBox(height:20),
          Container(
            width: MediaQuery.of(context).size.width/1.3,
            height: MediaQuery.of(context).size.height/19,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(child:                 ActionButtonsStyle(color: Colors.red, text: "Delete project", customFunction: () => ProjectsActions(currentProject:  widget.project,actions: ProjectActionsEnum.DELETE_PROJECT, ), icon: Icons.delete),
                ),
                SizedBox(width: 10,),
                Flexible(child:                 ActionButtonsStyle(color: Colors.orange, text: "Edit Project",customFunction: () => ProjectsActions(currentProject: project,actions: ProjectActionsEnum.EDIT_PROJECT,), icon: Icons.edit),
                ),
                SizedBox(width: 10,),
                Flexible(child:                 ActionButtonsStyle(color: Colors.indigoAccent, text: "Create Meetings",customFunction: () => ProjectsActions(currentProject: project,actions: ProjectActionsEnum.ADD_MEETINGS,), icon: Icons.access_time,),
                )
              ],
            ),
          ),
          SizedBox(height:5),
        ],
      ),
    );
  }
}

