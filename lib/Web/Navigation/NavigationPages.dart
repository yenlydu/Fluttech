import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/HandleProjects.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Mobile/Page/Admin/FindUsersPage/FindUsersPage.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AllProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AllProjectsPage();
  }
}

class AllProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: verticalWidget());
  }
}

class RightSideWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: double.infinity,
      color: Colors.blueGrey,
    );
  }
}

class verticalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height / 3;
    return Padding(
        padding: EdgeInsets.all(25.0),
        child: Container(
          height: size * 2,
          child: Scaffold(
            body: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: HandleProjects()
                          .constructProjectsList(size * 2, context),
                    ),

//                  RightSideWidget()
                  ],
                ),
              ],
            ),
          ),
        ));
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

  void getEmail(str) {
    setState(() {
      email = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 1.5,
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FindUsersPage(
                    getStudentSelected: getEmail,
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF7F8F8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 2,
                            offset: Offset(0.5, 0.5),
                            blurRadius: 2,
                          )
                        ]),
                    child: email != null
                        ? Text(
                            email,
                            style: TextStyle(
                              color: Color(0xFF5D1EB5),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Container(),
                  ),
                )
              ],
            ),
          ),
          sizedBox(10),
        ],
      ),
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
