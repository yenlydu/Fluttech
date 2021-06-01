import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Delete/DeleteButtons.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Edit/EditGroup.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/AddMeetings/AddMeetings.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Edit/EditProjectButton.dart';

class ProjectsActions extends StatefulWidget
{
  final ProjectActionsEnum actions;
  ProjectInformation currentProject = null;
  UnitInformation currentUnit = null;
  final function;

  ProjectsActions({this.currentUnit, this.currentProject, @required this.actions, this.function});

  @override
  ProjectsActionsState createState() => ProjectsActionsState();
}

class ProjectsActionsState extends State<ProjectsActions>
{
  String selectedMail;
  final TextEditingController meetingNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context)
  {
    switch(widget.actions) {
      case ProjectActionsEnum.DELETE_UNITS: {
        return deleteUnit(unitInformation: widget.currentUnit, context: context,);
      }
      break;
      case ProjectActionsEnum.EDIT_UNIT: {
        print("etering edit unit");
        return EditProjectButton(editType: ProjectActionsEnum.EDIT_UNIT, currentUnit: widget.currentUnit, text:"Editing Unit");
      }

      case ProjectActionsEnum.EDIT_PROJECT: {
        return EditProjectButton(editType: ProjectActionsEnum.EDIT_PROJECT,currentProject: widget.currentProject,text:"Editing Project");
      }
      break;
      case ProjectActionsEnum.ADD_MEETINGS: {
        return AddMeetings(currrentProject: widget.currentProject);
      }
      break;
      case ProjectActionsEnum.DELETE_PROJECT: {
        return deleteAction(project: widget.currentProject, context: context, projectEnum: ProjectActionsEnum.DELETE_PROJECT,);
      }
      break;
      case ProjectActionsEnum.UNREGISTER_PROJECT_STUDENT: {
        return deleteAction(project: widget.currentProject, context: context, projectEnum: ProjectActionsEnum.UNREGISTER_PROJECT_STUDENT,);
      }
      break;
      case ProjectActionsEnum.EDIT_GROUP: {
        print (widget.currentProject.teammates.toString());
        return EditGroup(projectInformation : widget.currentProject);
      }
      break;
    }
    return Container();
  }
}