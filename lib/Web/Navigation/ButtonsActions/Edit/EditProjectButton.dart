import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Edit/EditPopup.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/Constants/ProjectsActionsConstants.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';

class EditProjectButton extends StatefulWidget {
  final ProjectInformation currentProject;
  final UnitInformation currentUnit;
  final String text;
  final ProjectActionsEnum editType;

  EditProjectButton({this.currentProject, this.currentUnit, this.text, this.editType});
  @override
  _EditProjectButtonState createState() => _EditProjectButtonState();
}


class _EditProjectButtonState extends State<EditProjectButton> {

  @override
  Widget build(BuildContext context) {
      return AlertDialog(

          content:SingleChildScrollView(

            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children:[
                  widget.currentProject != null ? popUpTitle(context: context, project: widget.currentProject, text: widget.text) : popUpTitle(context: context, unitInformation:  widget.currentUnit, text: widget.text),
                  SizedBox(height:30),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        widget.currentProject != null ? EditPopup(projectEdit: widget.currentProject,) : EditPopup(unitEdit: widget.currentUnit,)
                      ],
                    ),
                  ),
                ]
            ),
          )
      );
    // MAXIME: ici, les notions vont permettre de modifier les données (date, prof, etc.)dans firebase
  }
}
