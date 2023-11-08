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
}
