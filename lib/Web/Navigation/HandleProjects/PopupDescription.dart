import 'package:flutter/material.dart';
import 'ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
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
                  spaceBetweenWidgets,
                  Text(project.description, style: TextStyle(fontSize: 17, color: Color(0xFFC27BD9), ),),
                  spaceBetweenWidgets,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children:[
                          displaySubtitle("Begin Date"),
                          spaceBetweenWidgets,
                          Text(formatter( project.beginDate), style: TextStyle(fontSize: 17, color: Color(0xFFC27BD9), ),),


                        ]
                      ),
                      Column(
                          children:[
                            displaySubtitle("End Date"),
                            spaceBetweenWidgets,
                            Text(formatter(project.endDate), style: TextStyle(fontSize: 17, color: Color(0xFFC27BD9), ),),


                          ]
                      )

                    ],
                  )
                ],
              ),
            ),
          ]
      ),
    );

  }
}