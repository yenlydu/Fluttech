import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';

class FindUsersPage extends StatefulWidget {
  FindUsersPage();
  @override
  _FindUsersPageState createState() => _FindUsersPageState();

}

class InputWidget extends StatelessWidget {

  final int index;

  InputWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return new Text("InputWidget: " + index.toString());
  }
}

class _FindUsersPageState extends State<FindUsersPage> {
  UsersAutocomplete usersAutocomplete = new UsersAutocomplete();

  Widget buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.lock, color: Colors.white),
              hintText: "Enter your Password",
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 45.0,
                  child: usersAutocomplete.userAutocomplete(),

                ),
//            UsersAutocomplete().shouldDisplay ? Text("string test")  : Spacer(),

              ],
            )
        ),
    );
  }
}
