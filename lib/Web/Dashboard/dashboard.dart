import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Page/Admin/FindUsersPage/FindUsersPage.dart';
import 'package:flutter2/Web/Navigation/NavigationBar.dart';
import 'package:flutter2/Web/Dashboard/dashboardBar.dart';
class   Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.transparent,

      height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          child:Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NavigationBar(),

                ],
              )
/*
              Expanded(
                flex: 1,

                child:Container(
                  color: Colors.transparent
                  ,
                  child: FindUsersPage() ,
                ),
              ),
              Expanded(

                flex: 6,
                child: Container(color: Colors.green),
              ),
*/


              ],
          ),
    );
  }
}
