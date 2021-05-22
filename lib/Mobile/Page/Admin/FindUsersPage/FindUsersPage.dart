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
    UsersAutocomplete usersAutocomplete = new UsersAutocomplete(getStudentSelected: getEmail,);
    // MAXIME : recupérer toutes les addresses mails et les transformer avec le type List
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
/*
        width: MediaQuery.of(context).size.width,
        height: 73,
*/
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  width: 500,
                 child: Column(
                   children:[
                     usersAutocomplete.userAutocomplete(mailAddressesList: mailAddressesList, labelName: "Student Mail"),
                     email != null ? Text(email): Container()
                   ]
                 )
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
