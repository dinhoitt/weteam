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
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          switch (day.weekday) {
            case 1:
              return Center(
                child: Text(
                  '월',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            case 2:
              return Center(
                child: Text(
                  '화',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            case 3:
              return Center(
                child: Text(
                  '수',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            case 4:
              return Center(
                child: Text(
                  '목',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            case 5:
              return Center(
                child: Text(
                  '금',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            case 6:
              return Center(
                child: Text(
                  '토',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              );
            case 7:
              return Center(
                child: Text(
                  '일',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              );
          }
        },
        defaultBuilder: (context, day, _) {
          if (day.weekday == DateTime.saturday) {
            return Center(
              child: Text(
                day.day.toString(),
                style: TextStyle(color: Colors.blue),
              ),
            );
          } else if (day.weekday == DateTime.sunday) {
            return Center(
              child: Text(
                day.day.toString(),
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Center(child: Text(day.day.toString()));
          }
        },
      ),
      locale: 'ko_KR', // 한국어
      daysOfWeekHeight: 50.0, // 요일 높이 조정
      rowHeight: 100.0, // 상하 간격
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: widget.focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(widget.selectedDay, day);
      },
      calendarFormat: widget.format,
      startingDayOfWeek: StartingDayOfWeek.sunday, // 일요일부터 시작
      onDaySelected: ((selectedDay, newFocusedDay) {
        widget.onDaySelected(selectedDay, newFocusedDay);
      }),
      headerVisible: false,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.red),
      ),
      calendarStyle: CalendarStyle(
        defaultTextStyle: TextStyle(color: Colors.black),
        holidayTextStyle: TextStyle(color: Colors.red), // 공휴일 텍스트 스타일
        todayDecoration: BoxDecoration(
          color: Color(0xFF666666),
          shape: BoxShape.circle,
        ),
      ),
      holidayPredicate: (day) {
        // 공휴일 추가
        if (day == DateTime(day.year, 10, 3)) {
          return true;
        }
        return false;
      },
    );
  }
}
