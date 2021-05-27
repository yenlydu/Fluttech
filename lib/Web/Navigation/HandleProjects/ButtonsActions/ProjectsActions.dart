import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Delete/DeleteButtons.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/PickRangeDate.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/AddMeetings/AddMeetings.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Edit/EditProjectButton.dart';

class ProjectsActions extends StatefulWidget
{
  final ProjectActionsEnum actions;
  final ProjectInformation currrentProject;
  final function;

  ProjectsActions({@required this.currrentProject, @required this.actions, this.function});

  @override
  ProjectsActionsState createState() => ProjectsActionsState();
}

class ProjectsActionsState extends State<ProjectsActions>
{
  Widget getSelectedMail(tempSelectedMail)
  {
    setState(() {
      selectedMail = tempSelectedMail;
    });
  }
  String selectedMail;
  List<Reunion> reunions;
  final TextEditingController meetingNameController = TextEditingController();

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
                selectedMail != null? Text(selectedMail): Container(),
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


  @override
  void initState() {
    super.initState();
    setState(() {
      reunions = widget.currrentProject.reunions;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    switch(widget.actions.index) {
      case 0: {
        return deleteAction(widget.currrentProject, context);
      }
      break;
      case 1: {
        return EditProjectButton(editType: ProjectActionsEnum.EDIT_UNIT,currentProject: widget.currrentProject,getSelectedMail: getSelectedMail, text:"Editing Unit");
      }

      case 2: {
        return EditProjectButton(editType: ProjectActionsEnum.EDIT_PROJECT,currentProject: widget.currrentProject,getSelectedMail: getSelectedMail,text:"Editing Project");
      }
      break;
      case 3: {
        return AddMeetings(currrentProject: widget.currrentProject);
      }
    }
    return Container();
  }
}