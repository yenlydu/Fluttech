import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';

class PopupDescription extends StatelessWidget
{
  final ProjectInformation project;
  final UnitInformation unit;
  final ProjectActionsEnum projectEnum;


  PopupDescription({Key key, this.project,this.unit,this.projectEnum}) : super(key: key);

  Widget displaySubtitle(String subtitle)
  {
    return Text(subtitle, style: TextStyle(color: Color(0xFF875BC5),fontSize: 19,fontFamily: "Montserrat-Italic", fontWeight: FontWeight.bold, ),);
  }

  Widget displayTeammates()
  {
    return Column(
      children: [
        displaySubtitle("Teammates"),
        Container(
            width: 500,
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: project.teammates.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title:


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // MAXIME
                        project.teammates[index].image,
                        Text('${project.teammates[index].mail}')
                      ],
                    )
                );
              },
            )
        )

      ],
    );
  }

  Widget displayBeginEndDates(String text, DateTime date)
  {
    return Column(
        children:[
          displaySubtitle(text),
          SizedBox(height:5),
          this.project != null? Text(formatter( date), style: TextStyle(fontSize: 17, color: Color(0xFFF69F20), ),) : Text(formatter( date), style: TextStyle(fontSize: 17, color: Color(0xFFF69F20), ),),
        ]
    );
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
                  SizedBox(height:10),
                  displaySubtitle("Description"),
                  SizedBox(height:10),
                  this.project != null? Text(project.description, style: TextStyle(fontSize: 17, color: Color(0xFFF69F20), ),) :Text(unit.description, style: TextStyle(fontSize: 17, color: Color(0xFFF69F20), ),),
                  SizedBox(height:25),
                  !ResponsiveLayout.isSmallScreen(context) ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      displayBeginEndDates("Begin Date", this.project != null? project.projectStart: unit.unitStart),
                      displayBeginEndDates("End Date", this.project != null? project.projectEnd: unit.unitEnd),
                    ],
                  ) : Column(
                    children: [
                      displayBeginEndDates("Begin Date", this.project != null? project.projectStart: unit.unitStart),
                      displayBeginEndDates("End Date", this.project != null? project.projectEnd: unit.unitEnd),
                    ],
                  ),
                  SizedBox(height: 25,),
                  projectEnum == ProjectActionsEnum.STUDENT_DESCRIPTION ? displayTeammates() : Container(),
                ],
              ),
            ),
          ]
      ),
    );
  }
}