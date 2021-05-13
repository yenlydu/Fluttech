import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'DashboardBarItem.dart';
typedef void callBack(String val);

class DashboardBar extends StatefulWidget {
  List <bool> selected = [true, false, false];


  @override
  _DashboardBarState createState() => _DashboardBarState();
}

class _DashboardBarState extends State<DashboardBar> {

  void select(int n) {
    for (int i = 0; i < 3; i++) {
      if (i != n) {
        widget.selected[i] = false;
      }else {
        print (i);
        widget.selected[i] = true;
      }
    }
  }
  List<bool> getDashboardSelected()
  {
    return widget.selected;
  }

  void er()
  {

  }


  @override
  Widget build(BuildContext context) {

    return Container(

      height: 450.0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          new Expanded(
            flex: 1,
              child:Container(
                decoration: BoxDecoration(color: Colors.indigo),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: new Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DashboardBarItem(
                          active: widget.selected[0],
                          icon: FeatherIcons.logOut,
                          touched: ()
                          {
                            setState(() {
                              select(0);
                              print("widget : 2");

                            });
                          },
                        ),
                      ],
                    )
                ),
              ) ,
          ),
        ],
      ),
    );
  }
}

