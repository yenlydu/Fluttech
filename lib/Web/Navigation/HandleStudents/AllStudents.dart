import 'package:flutter/material.dart';
import 'package:flutter2/Web/CreateUser.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/RolesDropDown/RolesDropDown.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/DisplayHandleStudents.dart';

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