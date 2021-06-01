import 'package:flutter/material.dart';
import 'package:flutter2/Web/Style/ButtonsStyle.dart';
import 'package:flutter2/Web/routes.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Web/Style/NavigationStyle.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';

class NavigationBarWeb extends StatefulWidget {

  @override
  _NavigationBarWebState createState() => _NavigationBarWebState();

}
class _NavigationBarWebState extends State<NavigationBarWeb> {
  void _goHome()
  {
    print("enter");
    Navigator.pushNamed(context, "/");

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: !ResponsiveLayout.isSmallScreen(context)? 60: 30,
            height: !ResponsiveLayout.isSmallScreen(context)?60:30,
            decoration: decoration(),
            child: Center(
              child: Image.asset('images/icon.png'),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          !ResponsiveLayout.isSmallScreen(context)? Text("FluTECH", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, fontFamily: "Butler", ),) : Text("FluTECH", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, fontFamily: "Butler", )),
          NavigationItem(
            title: 'Units',
            namedRoute: routeUnits,
          ),
          NavigationItem(
            title: 'Users',
            namedRoute:  routeUsers,
          ),
          logOut(_goHome)

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
            width: !ResponsiveLayout.isSmallScreen(context) ? 100: 70,
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