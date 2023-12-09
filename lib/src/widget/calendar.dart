import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:weteam/src/controller/schedule_controller.dart';
import 'package:weteam/src/util/calendar_utils.dart';

class SimpleCalendar extends StatefulWidget {
  final CalendarFormat format;
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final void Function(DateTime, DateTime) onDaySelected;

  const SimpleCalendar({
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
  late CalendarController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<CalendarController>();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, _) => controller.buildEventMarker(date),
        dowBuilder: (context, day) => CalenderUtils.getWeekdayWidget(day),
        defaultBuilder: (context, day, _) =>
            controller.buildDefaultDayWidget(day),
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
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.red),
      ),
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(color: Colors.black),
        holidayTextStyle: TextStyle(color: Colors.red), // 공휴일 텍스트 스타일
        todayDecoration: BoxDecoration(
          color: Color(0xFF666666),
          shape: BoxShape.circle,
        ),
      ),
      holidayPredicate: (day) {
        return controller.isHoliday(day);
      },
    );
  }
}
