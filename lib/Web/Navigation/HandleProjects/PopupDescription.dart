import 'package:flutter/material.dart';
import 'ProjectInformation.dart';
class PopupDescription extends StatelessWidget
{
  ProjectInformation project;

  PopupDescription({Key key, @required this.project}) : super(key: key);

  Widget displaySubtitle(String subtitle)
  {
    return Text(subtitle, style: TextStyle(color: Color(0xFF875BC5),fontSize: 19,fontFamily: "Montserrat-Italic", fontWeight: FontWeight.bold, ),);
  }

  @override
  Widget build(BuildContext context)
  {
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            Container(
              width: MediaQuery.of(context).size.width/1.5,
              child:Column(
                children:[
                  SizedBox(
                    height: 10.0,
                  ),
                  displaySubtitle("Description"),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(project.description, style: TextStyle(fontSize: 17, color: Color(0xFFC27BD9), ),),
                ],
              ),
            ),
          ]
      ),
    );

  }
}