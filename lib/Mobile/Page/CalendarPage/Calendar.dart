import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Mobile/Tools/FireStore/FireStoreUser.dart';
import 'package:flutter2/Mobile/Tools/ServiceLocator/ServiceManager.dart';
import 'package:flutter2/Model/AppointementModel.dart';
import 'package:flutter2/Model/Constants.dart';
import 'package:flutter2/Model/UserModel.dart';
import 'package:table_calendar/table_calendar.dart';

import './Templates/Event.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key}) : super(key: key);
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Map<DateTime, List<Event>> selectedEvents;
  DateTime day;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.month;

  UserModel currentuser;
  List<AppointementModel> appointements = [];

  _initData(BuildContext context) async {
    currentuser = await locator<FireStoreUser>()
        .getUser(FirebaseAuth.instance.currentUser.uid);
    appointements =
        await locator<FireStoreUser>().getUserAppointements(currentuser);
    await fillCalendar();
  }

  Future<Map<DateTime, List<Event>>> fillCalendar() async {
    appointements.forEach((element) {
      var datetoappoint = DateTime(element.timetoAppoint.year,
          element.timetoAppoint.month, element.timetoAppoint.day);
      var original = selectedEvents[datetoappoint];
      if (original == null) {
        selectedEvents[datetoappoint] = [Event(title: element.name)];
      } else {
        selectedEvents[datetoappoint] = List.from(original)
          ..addAll([Event(title: element.name)]);
      }
    });
    return selectedEvents;
  }

  @override
  void initState() {
    selectedEvents = {};
    /*WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fillCalendar().then((val) => setState(() {
            selectedEvents = val;
          }));
      //print( ' ${_events.toString()} ');
    });*/
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  // Calendar Page
  @override
  Widget build(BuildContext context) {
    //_initData(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: new EdgeInsets.only(top: 25),
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _focusedDay,
                      calendarFormat: format,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekVisible: true,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(() {
                          format = _format;
                        });
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected:
                          (DateTime selectedDay, DateTime focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      eventLoader: _getEventsfromDay,
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        todayDecoration: BoxDecoration(
                          color: Constants().focused_color,
                          shape: BoxShape.rectangle,
                          //borderRadius: BorderRadius.circular(5.0),
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Constants().selected_color,
                          shape: BoxShape.rectangle,
                          //borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        formatButtonShowsNext: false,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
