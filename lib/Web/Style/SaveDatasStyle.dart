import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';

Widget saveDatas({function})
{
  return SizedBox(
    width: 100,
    height: 40,
    child:  RaisedButton(
      color: Colors.green,
      padding: EdgeInsets.all(8.0),
      onPressed: ()=>{
        if (function != null)
          function()
      },
      child: Align(
        alignment: Alignment.center,
        child: Text(
            "Save Datas",
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center
        ),
      ),
    ),
  );
}

Widget removeFields({String fieldName})
{
  return SizedBox(
    height: 30,
    child:  RaisedButton(
      color: Color(0xFFEF5350),
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Icon(Icons.remove, size: 15,),
          Text(fieldName, style: TextStyle(fontSize: 12),)
        ],
      ),
      onPressed: ()=>{
      },
    ),
  );
}
