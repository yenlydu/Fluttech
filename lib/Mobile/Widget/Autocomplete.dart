import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import './../Model/Constants.dart';
import 'package:flutter2/Model/Constants.dart';


class UsersAutocomplete  {
  var shouldDisplay = false;
  bool get getShouldDisplay => shouldDisplay;

  var _suggestionsTextFieldController = new TextEditingController();
  List mailAddressesList = [
    "yen-ly.duong@epitech.eu",
    "y.duong@epitech.eu",
    "maxime.le-gall@epitech.eu",
    "max.le-gall@epitech.eu",
    "ugo.santoro@epitech.eu",
    "ugo.sant@epitech.eu",
    "dylan.ferreira@epitech.eu",
    "dyl.fe@epitech.eu",

  ];

  Widget userAutocomplete() {
    return AutoCompleteTextField(
        controller: _suggestionsTextFieldController,
        suggestions: mailAddressesList,
        clearOnSubmit: false,
        style: TextStyle(color: Colors.deepPurple,
            fontFamily: 'OpenSans',
            fontSize: 16.0),
        decoration: InputDecoration(
          fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )
        ),
        itemFilter: (item, query) {
          return item.toLowerCase().startsWith(query.toLowerCase());
        },
        itemSorter: (a, b) {
          return (a.compareTo(b));
        },
        itemSubmitted: (item) {
          print("ENTERING" + item);
          shouldDisplay = true;
          _suggestionsTextFieldController.text = item;
        },
        itemBuilder: (context, item) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  item,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          );
        }
    );
  }
}