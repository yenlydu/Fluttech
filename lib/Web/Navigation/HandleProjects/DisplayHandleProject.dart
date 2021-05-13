import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter2/Web/Navigation/HandleProjects/PopupDescription.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
class DisplayHandleProject
{
  static final appContainer =
  html.window.document.getElementById('app-container');

  Widget displayTitle({String title})
  {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: TextStyle(color: Color(0xFF5D1EB5),fontSize: 22,fontWeight: FontWeight.bold, ),),
    );

  }


  Widget singleItem({BuildContext context, ProjectInformation project}) {
    return Center(
    child:InkWell(
      onTap: ()=> {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return PopupDescription(project: project,);
          })
      },
      child: Container(
      width: MediaQuery.of(context).size.width/1.6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF7F8F8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 2,
            offset: Offset(0.5,0.5),
            blurRadius: 2,
          )
        ]
      ),
      child : Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            displayTitle(title: project.title),
            SizedBox(
              height: 20.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("enter"),
                Text("enter1"),
                Text("enter2"),
                Text("enter3")
              ],
            )

            /*
            icon==null?Text(value, style: TextStyle(fontSize: 21, color: Color(0xFFB67FFF), ),):
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Center(
                    child: Container(
                      child: Row(

                        children: [
                          Text(value, style: TextStyle(fontSize: 18, color:Colors.deepPurpleAccent, fontWeight: FontWeight.bold),),
                          Icon(icon,color: iconColor,)

                        ],
                      ),
                    )
                ),
              ],
            )
  */
          ],
        ),
        ),
        ),
      ),
    );
  }

}