import 'package:flutter/material.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/CreateProject/CreateProjectPopup.dart';
class CreateProjectButton extends StatefulWidget {
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
      width: 140,
      height: 50,
      child: ActionButtonsStyle(color: Colors.lightGreen, customFunction: ()=> CreateProjectPopup(mailAddressesList: mailAddressesList, ),text: "Create Project", icon: Icons.add, textStyle: TextStyle(fontSize: 15)),
    );
  }
}
