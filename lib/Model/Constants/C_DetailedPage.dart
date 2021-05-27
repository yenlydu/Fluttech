import 'package:flutter/material.dart';

import 'C_Projects.dart';
import '../Constants.dart';

Widget studentName(Text name) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Text(
      name.data,
      style: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        fontFamily: 'OpenSans',
      ),
    ),
  );
}

Widget textDPboth_title(Text name, TextStyle style) {
  return Container(
    child: Text(
      name.data,
      style: style,
    ),
  );
}

Widget textDP_elem1(Text name, TextStyle style) {
  return Container(
    child: Text(
      name.data,
      style: style,
    ),
  );
}

Widget textDP_elem2(Text name, TextStyle style) {
  return Container(
    alignment: Alignment.topLeft,
    child: Text(
      "Between " + name.data,
      style: style,
    ),
  );
}

//DP MODULES
Widget add_Project(BuildContext _context) {
  return TextButton.icon(
    onPressed: () => showDialog(
      context: _context,
      builder: (_context) => AlertDialog(
        title: Text("Add a Project"),
        content: Container(
          child: Column(
            children: <Widget>[
              Text("Enter Project Title"),
              TextFormField(),
              sizeBox_Spacing(30),
              Text("Enter Project Start Date"),
              TextFormField(),
              sizeBox_Spacing(30),
              Text("Enter Project End Date"),
              TextFormField(),
            ],
          ),
        ), //Text("Enter Module Title"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(_context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(_context),
            child: Text("Save"),
          ),
        ],
      ),
    ),
    icon: Icon(Icons.add, size: 18),
    label: Text("Add a Project"),
  );
}

Widget add_Appointment(BuildContext _context) {
  return TextButton.icon(
    onPressed: () => showDialog(
      context: _context,
      builder: (_context) => AlertDialog(
        title: Text("Add a Appointment"),
        content: Container(
          child: Column(
            children: <Widget>[
              Text("Enter Appointment Title"),
              TextFormField(),
              sizeBox_Spacing(30),
              Text("Enter Appointment Start Date"),
              TextFormField(),
              sizeBox_Spacing(30),
              Text("Enter Appointment End Date"),
              TextFormField(),
            ],
          ),
        ), //Text("Enter Module Title"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(_context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(_context),
            child: Text("Save"),
          ),
        ],
      ),
    ),
    icon: Icon(Icons.add, size: 18),
    label: Text("Add a Appointment"),
  );
}
