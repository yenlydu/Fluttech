import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/DisplayAllProjects.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/HandleUnits/HandleUnits.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/CreateProject/CreateProjectButton.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/DisplayHandleStudents.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;

import 'package:flutter2/Web/CreateUser.dart';
import 'package:flutter2/Mobile/Widget/Autocomplete.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:flutter2/Web/Navigation/HandleStudents/RolesDropDown/RolesDropDown.dart';

class AllProjects extends StatefulWidget {
  final getUnits;
  const AllProjects({Key key, this.getUnits}) : super(key: key);

  @override
  _AllProjectsState createState() => _AllProjectsState();
}
class _AllProjectsState extends State<AllProjects>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ResponsiveLayout(
      largeScreen: ConstructAllProjects(widget.getUnits),
    );
  }
}
class ConstructAllProjects extends StatelessWidget {
  final getUnits;
  ConstructAllProjects(this.getUnits);
  //MAXIME : récuperer les units sous forme de list d'Unit information
  List<UnitInformation> unitInformation = [
  new UnitInformation(
    unitID: "FirstModule",
    name: "FIRST MOD",
    description:
    "DESCRIPTION TEST",
    unitStart : DateTime(2021, 09, 28, 15, 30),
    unitEnd: DateTime(2023, 09, 28, 15, 30),
    creditAvailable: 10,
  ),
  new UnitInformation(
    unitID: "SecondFirstModule",
    name: "SECOND Module",
    description:
    "DESCRIPTION TEST2",
    unitStart : DateTime(2010, 09,01, 15, 30),
    unitEnd: DateTime(2010, 09, 20, 15, 30),
    creditAvailable: 20,
  ),new UnitInformation(
      unitID: "thirdModule",

      name: "THIRD Module",
    description:
    "DESCRIPTION TEST3",
    unitStart : DateTime(2012, 09,01, 15, 30),
    unitEnd: DateTime(2012, 09, 20, 15, 30),
    creditAvailable: 7,
  ),new UnitInformation(
    name: "ZF Module",
      unitID: "FourthFirstModule",
    description:
    "DESCRIPTION TEST4",
    unitStart : DateTime(2014, 09,01, 15, 30),
    unitEnd: DateTime(2014, 09, 20, 15, 30),
    creditAvailable: 10,
  ),new UnitInformation(
      name: "THIRD Module",
      unitID: "FIFTHModule",

      description:
      "DESCRIPTION TEST3",
      unitStart : DateTime(2012, 09,01, 15, 30),
      unitEnd: DateTime(2012, 09, 20, 15, 30),
      creditAvailable: 7,
    ),new UnitInformation(
      name: "ZF Module",
      unitID: "ssixFirstModule",
      description:
      "DESCRIPTION TEST4",
      unitStart : DateTime(2014, 09,01, 15, 30),
      unitEnd: DateTime(2014, 09, 20, 15, 30),
      creditAvailable: 10,
    ),
    new UnitInformation(
      unitID: "7FirstModule",

      name: "THIRD Module",
      description:
      "DESCRIPTION TEST3",
      unitStart : DateTime(2012, 09,01, 15, 30),
      unitEnd: DateTime(2012, 09, 20, 15, 30),
      creditAvailable: 7,
    ),new UnitInformation(
      name: "ZF Module",
      unitID: "9FirstModule",

      description:
      "DESCRIPTION TEST4",
      unitStart : DateTime(2014, 09,01, 15, 30),
      unitEnd: DateTime(2014, 09, 20, 15, 30),
      creditAvailable: 10,
    )
  ];

Future<http.Response> fetchUnits() {
  return http.get(Uri.parse('https://us-central1-flutter2-f9a8c.cloudfunctions.net/getUnits'));
}

  Widget tes(BuildContext context) {
    if (!ResponsiveLayout.isSmallScreen(context)) {
      return Container(
//          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/1.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CreateProjectButton(),
            Flexible(
              child: 
              // ElevatedButton(
              //   onPressed: fetchUnits(),
              //   child: Text("TEST BUTTON FETCH UNITS"),
              //   )
              HandleUnits(unitInformation: unitInformation)
                  .constructProjectsList(40, context),
            ),
          ],
        )
      );
    }
    else{
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CreateProjectButton(height: 50,width: 140,),
            Flexible(
              child: HandleUnits(unitInformation: unitInformation)
                  .constructProjectsList(40, context),
            ),
          ],
        )
      );
    }

  }
  @override
  Widget build(BuildContext context) {

    this.getUnits != null ? this.getUnits(unitInformation): Container();

    double size = MediaQuery.of(context).size.height / 3;
    return Container(
        child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Container(
              height: size  * 1.8,
                child: Stack(
                  children: [
                    tes(context),
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