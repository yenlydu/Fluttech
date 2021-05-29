import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Edit/EditPopup.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/EditButtonStyle.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/PickRangeDate.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';

class EditProjectButton extends StatefulWidget {
  final ProjectInformation currentProject;
  final getSelectedMail;
  final String text;
  final ProjectActionsEnum editType;

  EditProjectButton({@required this.currentProject, this.getSelectedMail, this.text, this.editType});
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
                popUpTitle(context: context, project: widget.currentProject, text: widget.text),
                SizedBox(height:30),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                     EditPopup(currentProject: widget.currentProject,editType: widget.editType,)

                    ],
                  ),
                ),
              ]
          ),
        )
    );  }
}
