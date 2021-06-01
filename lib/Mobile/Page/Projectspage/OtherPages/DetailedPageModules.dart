import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Page/Projectspage/OtherPages/ProjectsPage.dart';
import 'package:intl/intl.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUnit.dart';
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
  final TextEditingController _projectcontroller = TextEditingController();
  final TextEditingController _appointnamecontroller = TextEditingController();
  final TextEditingController _appointroomcontroller = TextEditingController();
  bool _ismanager;
  bool _isuser;
  bool _showsub;
  bool _showunsub;

  //Project Creation
  String projectname = '';
  DateTime projectstartDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day - 1);
  DateTime projectregisterendDate = DateTime.now();
  DateTime projectendDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  String projectstartDatetext = '';
  String projectregisterendDatetext = '';
  String projectendDatetext = '';

  Future<void> selectStartDate(
      BuildContext context, DateTime currentDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        projectstartDate = picked;

        projectstartDatetext =
            DateFormat('yyyy-MM-dd').format(projectstartDate);
      });
  }

  Future<void> selectEndRegisterDate(
      BuildContext context, DateTime currentDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        projectregisterendDate = picked;
        projectregisterendDatetext =
            DateFormat('yyyy-MM-dd').format(projectregisterendDate);
      });
  }

  Future<void> selectEndDate(BuildContext context, DateTime currentDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        projectendDate = picked;
        projectendDatetext = DateFormat('yyyy-MM-dd').format(projectendDate);
      });
  }

  Future<void> createProject() async {
    locator<FireStoreUnit>().createProject(
        locator<FireStoreUser>().currentUser,
        widget.unitinfo,
        projectname,
        projectstartDate,
        projectregisterendDate,
        projectendDate);
  }

  //Appoint Creation
  String appointname = '';
  DateTime appointDate = DateTime.now();
  String room = '';

  Future<void> selectAppointDate(
      BuildContext context, DateTime currentDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        appointDate = picked;
      });
  }

  Future<void> createAppoint() async {
    locator<FireStoreUnit>().createAppointement(
        locator<FireStoreUser>().currentUser,
        widget.unitinfo,
        appointname,
        room,
        appointDate);
  }

//DP MODULES
  Widget add_Project(BuildContext _context) {
    return TextButton.icon(
      onPressed: () => showDialog(
        context: _context,
        builder: (_context) => AlertDialog(
          title: Text("Add a Project"),
          content: Container(
            child: Column(
              children: <Widget>[
                Text("Enter Project Title"),
                TextFormField(controller: _projectcontroller),
                sizeBox_Spacing(30),
                Text("Enter Project Start Date"),
                RaisedButton(
                  onPressed: () => selectStartDate(_context, projectstartDate),
                  child: Text(projectstartDatetext),
                ),
                sizeBox_Spacing(30),
                Text("Enter Project Register End Date"),
                RaisedButton(
                  onPressed: () =>
                      selectEndRegisterDate(_context, projectregisterendDate),
                  child: Text(projectregisterendDatetext),
                ),
                sizeBox_Spacing(30),
                Text("Enter Project End Date"),
                RaisedButton(
                  onPressed: () => selectEndDate(_context, projectendDate),
                  child: Text(projectendDatetext),
                ),
              ],
            ),
          ), //Text("Enter Module Title"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(_context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => {
                createProject(),
                Navigator.pop(_context),
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
      icon: Icon(Icons.add, size: 18),
      label: Text("Add a Project"),
    );
  }

  Widget add_Appointment(BuildContext _context) {
    return TextButton.icon(
      onPressed: () => showDialog(
        context: _context,
        builder: (_context) => AlertDialog(
          title: Text("Add a Appointment"),
          content: Container(
            child: Column(
              children: <Widget>[
                Text("Enter Appointment Title"),
                TextFormField(controller: _appointnamecontroller),
                sizeBox_Spacing(30),
                Text("Enter Appointment Room"),
                TextFormField(controller: _appointroomcontroller),
                sizeBox_Spacing(30),
                Text("Enter Appointment Date"),
                RaisedButton(
                  onPressed: () => selectEndDate(_context, projectendDate),
                  child: Text(projectendDatetext),
                ),
              ],
            ),
          ), //Text("Enter Module Title"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(_context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => {
                createAppoint(),
                Navigator.pop(_context),
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
      icon: Icon(Icons.add, size: 18),
      label: Text("Add a Appointment"),
    );
  }

  Widget _buttonsWithAlert(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            add_Project(context),
            add_Appointment(context),
          ],
        )
      ],
    );
  }

  Widget _groupButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          Visibility(
            visible: _isuser,
            child: Column(
              children: <Widget>[
                Visibility(
                  visible: _showsub,
                  child: TextButton.icon(
                    onPressed: () {
                      locator<FireStoreUnit>().subscribeToUnit(widget.unitinfo);
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
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                _context,
                MaterialPageRoute(
                    builder: (_context) => AppointmentsPage(
                          unitinfo: widget.unitinfo,
                        )),
              );
            },
            icon: Icon(Icons.calendar_today, size: 18),
            label: Text("Appointments"),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                _context,
                MaterialPageRoute(
                    builder: (_context) =>
                        ProjectsPage(unitinfo: widget.unitinfo)),
              );
            },
            icon: Icon(Icons.group_work, size: 18),
            label: Text("Projects"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _projectcontroller.addListener(() {
      // you need to add listener like this
      setState(() {
        projectname = _projectcontroller.text;
      });
    });

    _appointnamecontroller.addListener(() {
      // you need to add listener like this
      setState(() {
        appointname = _appointnamecontroller.text;
      });
    });

    _appointroomcontroller.addListener(() {
      // you need to add listener like this
      setState(() {
        room = _appointroomcontroller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    var role = locator<FireStoreUser>().currentUser.role;
    print("role is : " + role);
    _ismanager = (role == "manager" || role == "admin") ? true : false;
    _isuser = (role == "user") ? true : false;
    _showsub = widget.unitinfo.usersId
            .contains(locator<FireStoreUser>().currentUser.firebaseid)
        ? false
        : true;
    _showunsub = widget.unitinfo.usersId
            .contains(locator<FireStoreUser>().currentUser.firebaseid)
        ? true
        : false;
    projectstartDatetext = DateFormat('yyyy-MM-dd').format(projectstartDate);
    projectregisterendDatetext =
        DateFormat('yyyy-MM-dd').format(projectregisterendDate);
    projectendDatetext = DateFormat('yyyy-MM-dd').format(projectendDate);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                Visibility(
                  visible: _ismanager,
                  child: _buttonsWithAlert(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
