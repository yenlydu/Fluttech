import 'package:flutter/material.dart';
import 'dart:html' as html;

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
  Widget displaySubtitle(String subtitle)
  {
    return Text(subtitle, style: TextStyle(color: Color(0xFF875BC5),fontSize: 19,fontFamily: "Montserrat-Italic", fontWeight: FontWeight.bold, ),);
  }


  Widget singleItem({BuildContext context, String title, String description, IconData icon, Color iconColor}) {
    return Center(
    child:InkWell(
      onTap: ()=> {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Text("enter")
                ],
              ),
            );
          })
      },
      child: Container(
      width: MediaQuery.of(context).size.width/1.6,
      decoration: BoxDecoration(
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
            displayTitle(title: title),
            SizedBox(
              height: 10.0,
            ),
            displaySubtitle("Description"),
            SizedBox(
              height: 20.0,
            ),
            Text(description, style: TextStyle(fontSize: 21, color: Color(0xFFC27BD9), ),),/*
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