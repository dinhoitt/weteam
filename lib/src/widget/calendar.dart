// calendar.dart

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SimpleCalendar extends StatefulWidget {
  final CalendarFormat format;
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final void Function(DateTime, DateTime) onDaySelected;

  SimpleCalendar({
    Key? key,
    required this.format,
    required this.focusedDay,
    this.selectedDay,
    required this.onDaySelected,
  }) : super(key: key);

  @override
  _SimpleCalendarState createState() => _SimpleCalendarState();
}

class _SimpleCalendarState extends State<SimpleCalendar> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: widget.focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(widget.selectedDay, day);
      },
      calendarFormat: widget.format,
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: ((selectedDay, newFocusedDay) {
        widget.onDaySelected(selectedDay, newFocusedDay);
      }),
      headerVisible: false,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.red),
        weekdayStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
