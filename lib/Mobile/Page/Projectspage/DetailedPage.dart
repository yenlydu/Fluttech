import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUnit.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/FireStoreModel/UnitModel.dart';

import '../../../Model/Constants.dart';

class DetailedPage extends StatefulWidget {
  DetailedPage(
      {Key key,
      this.title,
      this.desc,
      this.credit,
      this.start,
      this.end,
      this.unitinfo})
      : super(key: key);

  final Text title;
  final Text desc;
  final Text credit;
  final Text start;
  final Text end;
  final UnitModel unitinfo;

  @override
  DetailedPageState createState() => DetailedPageState();
}

class DetailedPageState extends State<DetailedPage> {
  bool _showsub;
  bool _showunsub;

  @override
  Widget build(BuildContext context) {
    _showsub = widget.unitinfo.usersID
            .contains(locator<FireStoreUser>().currentUser.firebaseID)
        ? false
        : true;
    _showunsub = widget.unitinfo.usersID
            .contains(locator<FireStoreUser>().currentUser.firebaseID)
        ? true
        : false;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.data),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    widget.title.data,
                    style: textStyle_Title,
                  ),
                ),
                sizeBox_Spacing(10),
                separator(5),
                sizeBox_Spacing(25),
                Container(
                  child: Text(
                    widget.desc.data,
                    style: textStyle_Desc,
                  ),
                ),
                sizeBox_Spacing(10),
                separator(2),
                sizeBox_Spacing(10),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Available credits " + widget.credit.data,
                    style: textStyle_Credit,
                  ),
                ),
                sizeBox_Spacing(10),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Between " + widget.start.data,
                    style: textStyle_Date,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "and " + widget.end.data,
                    style: textStyle_Date,
                  ),
                ),
                sizeBox_Spacing(25),
                Container(
                  child: Column(
                    children: <Widget>[
                      Visibility(
                        visible: _showsub,
                        child: TextButton.icon(
                          onPressed: () {
                            locator<FireStoreUnit>()
                                .subscribeToUnit(widget.unitinfo);
                            setState(() {
                              _showsub = !_showsub;
                              _showunsub = !_showunsub;
                            });
                          },
                          icon: Icon(Icons.check, size: 18),
                          label: Text("Register"),
                        ),
                      ),
                      Visibility(
                        visible: _showunsub,
                        child: TextButton.icon(
                          onPressed: () {
                            locator<FireStoreUnit>()
                                .unsubscribeToUnit(widget.unitinfo);
                            setState(() {
                              _showsub = !_showsub;
                              _showunsub = !_showunsub;
                            });
                          },
                          icon: Icon(Icons.cancel, size: 18),
                          label: Text("Unregister"),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          // Respond to button press
                        },
                        icon: Icon(Icons.calendar_today, size: 18),
                        label: Text("Appointments"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
