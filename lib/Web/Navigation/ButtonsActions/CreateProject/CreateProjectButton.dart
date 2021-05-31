import 'package:flutter/material.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/CreateProject/CreateProjectPopup.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
class CreateProjectButton extends StatefulWidget {
  final double width;
  final double height;
  CreateProjectButton({this.width, this.height});
  @override
  _CreateProjectButtonState createState() => _CreateProjectButtonState();
}

class _CreateProjectButtonState extends State<CreateProjectButton> {

  List mailAddressesList = [
    "teacher1@epitech.eu",
    "teacher2@epitech.eu",
    "teacr2@epitech.eu",
    "azdef@epitech.eu",
    "prof@epitech.eu",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: widget.width != null ? widget.width : 140,
      height: widget.height != null ? widget.height : 90,
      child: ActionButtonsStyle(color: Colors.green, customFunction: ()=> CreateProjectPopup(createType: ProjectActionsEnum.CREATE_UNITS,mailAddressesList: mailAddressesList, ),text: "Create Module", icon: Icons.add, textStyle: TextStyle(fontSize: 15)),
    );
  }
}
