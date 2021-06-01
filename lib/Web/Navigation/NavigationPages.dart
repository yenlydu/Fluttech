import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplayAllProjects.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/HandleUnits/HandleUnits.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/CreateProject/CreateProjectButton.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/DisplayHandleStudents.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter2/Web/CreateUser.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/RolesDropDown/RolesDropDown.dart';
import 'package:firebase_core/firebase_core.dart';

class AppColors {

}


class AllProjects extends StatefulWidget {
  final getUnits;
  const AllProjects({Key key, this.getUnits}) : super(key: key);

  @override
  _AllProjectsState createState() => _AllProjectsState();
}
class _AllProjectsState extends State<AllProjects>
{
  static List <UnitInformation> units;
  @override
  void initState() {
    super.initState();
    setState(() {
      getFirebaseUnits();
      print("INIT STATE");

    });

  }
  Future<void> getFirebaseUnits() async {
    print("entering");
    final res = await http.get(Uri.parse('https://us-central1-flutter2-f9a8c.cloudfunctions.net/getUnits'));
    print('[onRequest] Res: ${res.body.toString()}');
      units = parseUnits(res.body);
    for(var i = 0; i < units.length; i++){
      print ("TESTING");
      print (units[i].toString());
      print("\n");
    }
  }


  FirebaseFunctions functions = FirebaseFunctions.instance;
  //MAXIME : récuperer les units sous forme de list d'Unit information

  Widget tes(BuildContext context) {
    if (!ResponsiveLayout.isSmallScreen(context)) {
      return Container(
//          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/1.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CreateModuleButton(),
              HandleUnits(unitInformation: units)
                  .constructProjectsList(40, context),
            ],
          )
      );
    }
    else{
      return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CreateModuleButton(height: 50,width: 140,),
              Flexible(child:               HandleUnits(unitInformation: units)
                  .constructProjectsList(40, context),
              )
            ],
          )
      );
    }

  }

  @override
  Widget build(BuildContext context) {
  getFirebaseUnits();
    widget.getUnits != null ? widget.getUnits(units): Container();
    double size = MediaQuery.of(context).size.height / 3;
    return Container(
        child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Container(
                height: size  * 1.8,
                child: Stack(
                    children: [

                      Text("enter" + units.length.toString()),
                      tes(context)
                    ]
                )
            )
        )
    );
  }
}

class RightSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  String displayedName = "temp name";
  String phoneNumber = "+33600000000";
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

  void getStudentDisplayName()
  {
    setState(() {
      if (email != null) {
        //MAXIME: Connect to firebase and retrieve displayed name + phon enumber
//        displayedName =
//        phoneNumber =
      }
    });
  }

  Widget displayStudent()
  {
//    getStudentDisplayName()
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: !ResponsiveLayout.isSmallScreen(context) ? MainAxisAlignment.start: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                // MAXIME : getdisplay name
                child: !ResponsiveLayout.isSmallScreen(context) ? Row(
                  children: [
                    Text(email, style: TextStyle(color: Color(0xFF875BC5),fontSize: 21,fontFamily: "Montserrat", fontWeight: FontWeight.bold),),
                    Text(" (" + displayedName +")", style: TextStyle(color: Color(0xFF875BC5),fontSize: 17,fontFamily: "Montserrat", ),),
                  ],
                ) : Column(
                    children: [
                      Text(email, style: TextStyle(color: Color(0xFF875BC5),fontSize: 21,fontFamily: "Montserrat", fontWeight: FontWeight.bold),),
                      Text(" (" + displayedName +")", style: TextStyle(color: Color(0xFF875BC5),fontSize: 17,fontFamily: "Montserrat", ),),
                    ],
                  ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            width: 500,
            height: 130,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Student phone number : ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xFF875BC5) ),),
                    Text(phoneNumber, style: TextStyle(fontSize: 16, ),),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(currentRole),
                    RolesDropDown(text: "Change User Role", getUserRole: getSelectedRole,),
                  ],
                ),
              ],
            )
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child:               DisplayHandleStudent(),
              )
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
        body: SingleChildScrollView(
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
                            width: !ResponsiveLayout.isSmallScreen(context) ? 400 : MediaQuery.of(context).size.width/1.2,
                            child: usersAutocomplete.userAutocomplete(mailAddressesList: mailAddressesList, labelName: "Student mail", clear: true),
                            )
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