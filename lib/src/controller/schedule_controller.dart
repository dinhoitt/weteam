import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/model/event.dart';

class CalendarController extends GetxController {
  var selectedEvents = {}.obs;

  void addEvent(DateTime date, Event event) {
    if (selectedEvents[date] != null) {
      selectedEvents[date].add(event);
    } else {
      selectedEvents[date] = [event];
    }
    update();
  }

  List<Event> getEventsForDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  Widget? buildEventMarker(DateTime date) {
    var events = getEventsForDay(date);
    if (date.day == 16) {
      return _buildReqularMeetingMarker();
    } else if (events.isNotEmpty) {
      return Positioned(
        child: _buildEventsMarker(date, events),
      );
    }
    return null;
  }

  Widget buildDefaultDayWidget(DateTime day) {
    if (day.weekday == DateTime.saturday) {
      return Center(
        child: Text(
          day.day.toString(),
          style: const TextStyle(color: Colors.blue),
        ),
      );
    } else if (day.weekday == DateTime.sunday) {
      return Center(
        child: Text(
          day.day.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      );
    } else {
      return Center(child: Text(day.day.toString()));
    }
  }

  // 공휴일 결정
  bool isHoliday(DateTime day) {
    return day == DateTime(day.year, 5, 5); // 5월 5일 어린이날
  }

  // 날짜 셀 안에 일정 추가 test
  Widget _buildReqularMeetingMarker() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: const Text(
        '정기회의',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.0,
        ),
      ),
    );
  }
}

Widget _buildEventsMarker(DateTime date, List<Event> events) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue,
    ),
    width: 16.0,
    height: 16.0,
    child: Center(
      child: Text(
        '${events.length}',
        style: const TextStyle().copyWith(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    ),
  );
}
