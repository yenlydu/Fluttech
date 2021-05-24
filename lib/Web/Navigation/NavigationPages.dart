import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/HandleProjects.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ButtonsActions/CreateProjectButton.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/DisplayHandleStudents.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter2/Web/CreateUser.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/CustomDropDown/CustomDropDown.dart';
class AllProjects extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      double size = MediaQuery.of(context).size.height / 3;
      return Padding(
          padding: EdgeInsets.all(40.0),
          child: Container(
            height: size  * 1.8,
            child: Scaffold(
              body: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CreateProjectButton(),
                      Flexible(
                        child: HandleProjects()
                            .constructProjectsList(size * 2, context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
      );
  }
}

class RightSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 300,
      height: double.infinity,
      color: Colors.blueGrey,
    );
  }
}

Widget test()
{
}

class AllStudents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: HandleStudentsPage(),
    );
  }
}

class HandleStudentsPage extends StatefulWidget {
  final void customFunction;
  HandleStudentsPage({Key key, this.customFunction}) : super(key: key);
  @override
  _HandleStudentsPageState createState() => _HandleStudentsPageState();
}

class _HandleStudentsPageState extends State<HandleStudentsPage> {
  String email;
  UsersAutocomplete usersAutocomplete;

  void getEmail(str) {
    setState(() {
      email = str;
    });
  }
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

  @override
  void initState() {
    super.initState();
    setState(() {
      usersAutocomplete = new UsersAutocomplete(getStudentSelected: getEmail,);
    });

  }
  Widget displayStudent()
  {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child:               Text(email, style: TextStyle(color: Color(0xFF875BC5),fontSize: 21,fontFamily: "Montserrat"),),
              )
            ],
          ),
          SizedBox(height: 30,),
          Container(
            width: 500,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:  Color(0xFFF7F8F8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 2,
                    offset: Offset(0.5,0.5),
                    blurRadius: 2,
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("email"),
                CustomDropDown(text: "Change User Role",),

              ],
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:
      Container(
        margin: const EdgeInsets.only(top: 20.0),
          width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/1.4,
        child:
            Column(
              children: [
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),
                    Container(
                        width: 400,
                        child: usersAutocomplete.userAutocomplete(mailAddressesList: mailAddressesList, labelName: "Student mail", clear: true)
                    ),
                  ],
                ),
                SizedBox(height: 20),

                email != null ? displayStudent() : Container(),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CreateUser()),
                              );
                              // Add your onPressed code here!
                            },
                            child: const Icon(Icons.person_add),
                            backgroundColor: Colors.deepPurple,
                          ),
                        )

                    )
                )

              ],
            )
      )

    );

  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: ProfileState(),
    );
  }
}

class ProfileState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("e,ter"),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 500,
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: <Widget>[
          Text(
            "Profile",
            style: TextStyle(fontFamily: 'Montserrat'),
          )
        ],
      ),
    );
  }
}
