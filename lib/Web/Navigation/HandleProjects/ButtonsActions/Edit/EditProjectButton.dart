import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Edit/EditPopup.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/EditButtonStyle.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/Constants/PickRangeDate.dart';

class EditProjectButton extends StatefulWidget {
  final ProjectInformation currentProject;
  final getSelectedMail;

  EditProjectButton({@required this.currentProject, this.getSelectedMail});
  @override
  _EditProjectButtonState createState() => _EditProjectButtonState();
}

class _EditProjectButtonState extends State<EditProjectButton> {
  @override
  Widget build(BuildContext context) {

    // MAXIME: ici, les notions vont permettre de modifier les données (date, prof, etc.)dans firebase
    return AlertDialog(

        content:SingleChildScrollView(

          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:[
                popUpTitle(context: context, project: widget.currentProject, text: "Editing Module"),
                SizedBox(height:30),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      EditPopup(currentProject: widget.currentProject,),
                    ],
                  ),
                ),
              ]
          ),
        )
    );  }
}
