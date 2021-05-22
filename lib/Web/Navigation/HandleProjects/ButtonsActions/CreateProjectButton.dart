import 'package:flutter/material.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';

class CreateProjectButton extends StatefulWidget {
  @override
  _CreateProjectButtonState createState() => _CreateProjectButtonState();
}

class _CreateProjectButtonState extends State<CreateProjectButton> {
  Widget createProjectPopup()
  {
    return AlertDialog(
        content: SizedBox(
        width: MediaQuery.of(context).size.width/2,
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 140,
      height: 50,
      child: ActionButtonsStyle(color: Colors.lightGreen, customFunction: createProjectPopup,text: "Create Project", icon: Icons.add, textStyle: TextStyle(fontSize: 15)),
    );
  }
}
