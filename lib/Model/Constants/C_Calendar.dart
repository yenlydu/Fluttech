import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:table_calendar/table_calendar.dart';

final kCalendarStyle = CalendarStyle(
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
);

final kHeaderStyle = HeaderStyle(
  titleCentered: true,
  formatButtonShowsNext: false,
);
