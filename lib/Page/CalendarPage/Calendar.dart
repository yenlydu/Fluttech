import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Model/Constants.dart';
import '../../Model/Constants/C_Calendar.dart';
import '../../Page/CalendarPage/Templates/Event.dart';

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

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  // Calendar Page
  @override
  Widget build(BuildContext context) {
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
