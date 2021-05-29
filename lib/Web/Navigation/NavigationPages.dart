import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplayAllProjects.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/HandleUnits/HandleUnits.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/CreateProject/CreateProjectButton.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/DisplayHandleStudents.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:flutter2/Web/CreateUser.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/RolesDropDown/RolesDropDown.dart';

class AllProjects extends StatefulWidget {
  const AllProjects({Key key}) : super(key: key);

  @override
  _AllProjectsState createState() => _AllProjectsState();
}
class _AllProjectsState extends State<AllProjects>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ResponsiveLayout(
      largeScreen: ConstructAllProjects(),
    );
  }
}
class ConstructAllProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height / 3;
    return Container(
      color: Colors.white,
        child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Container(
              color: Colors.white,
              height: size  * 1.8,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CreateProjectButton(),
                        Flexible(
                          child: HandleUnits()
                              .constructProjectsList(size * 2, context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
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
      color: Colors.white,
      child: HandleStudentsPage(),
    );
  }
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
  Roles userRole;
  String currentRole = "Student";
  UsersAutocomplete usersAutocomplete;

  void getEmail(str) {
    setState(() {
      email = str;
      userRole = Roles.STUDENT;
      getSelectedRole(userRole);
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
      userRole = Roles.STUDENT;
      getSelectedRole(userRole);
    });
  }
  void getSelectedRole(Roles selectedRole)
  {
    setState(() {
      userRole = selectedRole;
      if (userRole == Roles.STUDENT) {
        currentRole = "Student";
      } else if (userRole == Roles.TEACHER) {
        currentRole = "Teacher";
      } else {
        currentRole = "Administrator";
      }
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
                child: Text(email, style: TextStyle(color: Color(0xFF875BC5),fontSize: 21,fontFamily: "Montserrat", fontWeight: FontWeight.bold),),
              ),
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
                Text(currentRole),
                RolesDropDown(text: "Change User Role", getUserRole: getSelectedRole,),
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DisplayHandleStudent(),
//              DisplayHandleStudent(),
            ],
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child:
            Container(
                color: Colors.white,
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
                    email != null ? displayStudent(): Container(),
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
                    ),
                  ],
                )
            )
        )

    );

  }
}