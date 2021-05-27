import 'package:flutter/material.dart';
import 'package:flutter2/Web/routes.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Web/Style/NavigationStyle.dart';
class NavigationBarWeb extends StatefulWidget {

  @override
  _NavigationBarWebState createState() => _NavigationBarWebState();

}
class _NavigationBarWebState extends State<NavigationBarWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: decoration(),
            child: Center(
              child: Image.asset('images/icon.png'),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Text("FluTECH", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, fontFamily: "Butler", ),),
          SizedBox(
            width: 16,
          ),

          NavigationItem(
            title: 'Units',
            namedRoute: routeUnits,
          ),
          NavigationItem(
            title: 'Users',
            namedRoute:  routeUsers,
          ),
        ],
      ),
    );
  }
}

class NavigationItem extends StatefulWidget {
  final String title;
  final String namedRoute;

  const NavigationItem({@required this.title, this.namedRoute});
  @override
  _NavigationItemState createState() => _NavigationItemState();



}
class _NavigationItemState extends State<NavigationItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print ("widget" + widget.namedRoute);
        navKey.currentState.pushNamed( widget.namedRoute);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 30,
            width: 100,
            decoration: navigationButtons,
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Text(widget.title),
              ),
            ),
          ),
        )
      )
    );
  }
}