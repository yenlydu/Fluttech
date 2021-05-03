import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
class DashboardBar extends StatefulWidget {
  @override
  _DashboardBarState createState() => _DashboardBarState();
}

class _DashboardBarState extends State<DashboardBar> {
  List <bool> selected = [true, false, false, false, false];
  void select(int n) {
    for (int i = 0; i < 5; i++) {
      if (i != n) {
        selected[i] = false;
      }else {
        selected[i] = true;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      child: Column(
        children: [
          DashboardBarItem(
            active: selected[0],
            icon: FeatherIcons.home,
            touched: (){
              setState(() {
                select(0);
              });
            },
          ),
          DashboardBarItem(
            active: selected[1],
            icon: FeatherIcons.users,
            touched: (){
              setState(() {
                select(1);
              });
            },
          ),
          DashboardBarItem(
            active: selected[2],
            icon: FeatherIcons.logOut,
            touched: (){
              setState(() {
                select(2);
              });
            },
          ),
        ],
      ),
    );
  }
}

class DashboardBarItem extends StatefulWidget {
  final IconData icon;
  final Function touched;
  final bool active;

  DashboardBarItem({this.icon, this.touched, this.active});
  @override
  _DashboardBarItemState createState() => _DashboardBarItemState();
}

class _DashboardBarItemState extends State<DashboardBarItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.touched();
        },
        splashColor: Colors.white,
        hoverColor: Colors.white12,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            children: [
              Container(
                height: 60.0,
                width: 80.0,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 475),
                      height: 35.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                        color: widget.active ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular((10.0)))
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Icon(widget.icon, color: widget.active ? Colors.white : Colors.white54,
                      size: 19.0,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
