import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/Style/SaveDatasStyle.dart';

Widget removeDatabaseFields(saveEdit)
{
  return Column(
    children: [
      Text("Remove Fields", style: TextStyle(color: Color(0xFF875BC5),fontSize: 18,fontFamily: "Montserrat-Italic", decoration: TextDecoration.underline,),),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          removeFields(fieldName: "Description"),
          removeFields(fieldName: "Teacher")
        ],
      ),
      SizedBox(height:30),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [saveDatas(function: saveEdit),],
        )
      ),
    ],
  );
}

Widget editTextFields({setTextEditingController, Map<String, TextEditingController> editController})
{
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      TextField(
        controller: editController["title"],
        maxLines: 1,
        onSubmitted: (value) {setTextEditingController(editController);},
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
          labelText: 'Title',
        ),
      ),
      SizedBox(height:7),
      Container(

        child:       TextField(
          onSubmitted: (value) {setTextEditingController(editController);},
          controller: editController["description"],
          maxLines: null,
          minLines: 4,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
            labelText: 'Description',
          ),
        ),

      ),
      SizedBox(height:7),
    ]
  );
}