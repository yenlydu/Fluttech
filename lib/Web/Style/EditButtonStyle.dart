import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';


Widget titleDescriptionTextFields({setTextEditingController, Map<String, TextEditingController> editController})
{
  FocusNode _focusNode;

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
          focusNode: _focusNode,

          onSubmitted: (value) {setTextEditingController(editController);},
          controller: editController["description"],
          maxLines: null,
          keyboardType: TextInputType.multiline,
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