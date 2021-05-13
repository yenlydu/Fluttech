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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 45.0,
                    width:500,
                    child: usersAutocomplete.userAutocomplete(),
                  ),
                ),
              ],
            )
        ),

    );
  }
}
