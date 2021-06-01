import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import './../Model/Constants.dart';
import 'package:flutter2/Model/Constants.dart';

class UsersAutocomplete extends StatelessWidget {
  final getStudentSelected;
  UsersAutocomplete({Key key, this.getStudentSelected}) : super(key: key);
  var shouldDisplay = false;
  bool get getShouldDisplay => shouldDisplay;
  String email;
  var suggestionsTextFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget userAutocomplete({@required List mailAddressesList, String labelName, @required bool clear }) {
    return AutoCompleteTextField(
        key: key,
        clearOnSubmit: clear,
        controller: suggestionsTextFieldController,
        suggestions: mailAddressesList,
        style: TextStyle(color: Colors.deepPurple,
            fontFamily: 'OpenSans',
            fontSize: 16.0),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: labelName,
          fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        itemFilter: (item, query) {
          return item.toLowerCase().startsWith(query.toLowerCase());
        },
        itemSorter: (a, b) {
          return (a.compareTo(b));
        },

        itemSubmitted: (item) {
          shouldDisplay = true;
          suggestionsTextFieldController.text = item;
          this.getStudentSelected(item);
          email = item;
        },
        itemBuilder: (context, item) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  item,
                  style: TextStyle(color: Colors.black),
                ),

              ],
            ),
          );
        });
  }
}
