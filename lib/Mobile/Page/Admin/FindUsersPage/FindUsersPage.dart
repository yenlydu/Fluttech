import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/CreateUser.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class FindUsersPage extends StatefulWidget {
  final getStudentSelected;

  FindUsersPage({Key key, this.getStudentSelected}) : super(key: key);
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
  String email;

  void getEmail(str) {
    setState(() {
      email = str;
      widget.getStudentSelected(this.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    UsersAutocomplete usersAutocomplete = new UsersAutocomplete(
      getStudentSelected: getEmail,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 73,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  width: 500,
                  child: usersAutocomplete.userAutocomplete(),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateUser()),
          );
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
