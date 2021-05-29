import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/UnitModel.dart';
import 'package:getwidget/getwidget.dart';

import '../OtherPages/AppointmentsPage.dart';
import '../../../../Model/Constants.dart';
import '../../../../Model/Constants/C_Projects.dart';
import '../../../../Model/Constants/C_Accordion.dart';
import '../../../../Model/Constants/C_DetailedPage.dart';

class DetailedPageModules extends StatefulWidget {
  DetailedPageModules(
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
  DetailedPageModulesState createState() => DetailedPageModulesState();
}

class DetailedPageModulesState extends State<DetailedPageModules> {
  BuildContext _context;
  bool _showsub;
  bool _showunsub;

  Widget _buttonsWithAlert() {
    return Table(
      children: [
        TableRow(
          children: [
            add_Project(_context),
            add_Appointment(_context),
          ],
        )
      ],
    );
  }

  Widget _groupButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          TextButton.icon(
            onPressed: () {
              // Respond to button press
            },
            icon: Icon(Icons.check, size: 18),
            label: Text("Register"),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                _context,
                MaterialPageRoute(builder: (_context) => AppointmentsPage()),
              );
            },
            icon: Icon(Icons.calendar_today, size: 18),
            label: Text("Appointments"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    _showsub = widget.unitinfo.usersId
            .contains(locator<FireStoreUser>().currentUser.userid)
        ? false
        : true;
    _showunsub = widget.unitinfo.usersId
            .contains(locator<FireStoreUser>().currentUser.userid)
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
                textDPboth_title(widget.title, textStyle_Title),
                sizeBox_Spacing(10),
                separator(5),
                sizeBox_Spacing(25),
                textDPboth_title(widget.desc, textStyle_Desc),
                sizeBox_Spacing(10),
                separator(2),
                sizeBox_Spacing(10),
                textDP_elem2(Text("Available credits " + widget.credit.data),
                    textStyle_Credit),
                sizeBox_Spacing(10),
                textDP_elem2(
                    Text("Between " + widget.start.data), textStyle_Date),
                textDP_elem2(Text("and " + widget.end.data), textStyle_Date),
                sizeBox_Spacing(25),
                _groupButtons(),
                _buttonsWithAlert(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
