import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/HandleProjects.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Mobile/Page/Admin/FindUsersPage/FindUsersPage.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AllProjects extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return AllProjectsPage();
  }
}

class AllProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child:verticalWidget());
  }
}

class RightSideWidget  extends StatelessWidget
{
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

class verticalWidget extends StatelessWidget
{


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
                    child: HandleProjects().constructProjectsList(size * 2, context),
                  )
                   ,
//                  RightSideWidget()

                ],
              ),
            ],
        ),
        ),

      )

    );
  }

}
class AllStudents extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: AllStudentsPage( ),
    );
  }
}

class AllStudentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 500,
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            child: FindUsersPage(),
          )
        ],
      ),
    );
  }
}
class Profile extends StatelessWidget
{
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
          Text("Profile", style: TextStyle(fontFamily: 'Montserrat'),)
        ],
      ),
    );
  }
}


