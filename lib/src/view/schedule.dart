import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:weteam/src/data/image_date.dart';
import 'package:weteam/src/widget/calendar.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();
  final GlobalKey _calendarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              '내 스케쥴',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(context),
        floatingActionButton: FloatingActionButton(
          child: Image.asset(ImagePath.addschedule),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            setState(() {
                              selectedDate = date;
                              focusedDate = date;
                            });
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              selectedDate == null
                                  ? 'Choose a date'
                                  : '${selectedDate!.year}.${selectedDate!.month}',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Image.asset(ImagePath.downarrow),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.0),
                  child: Container(
                    height: 35.0,
                    child: Image.asset(ImagePath.sharetext),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: SimpleCalendar(
                  key: _calendarKey,
                  format: CalendarFormat.month,
                  focusedDay: focusedDate,
                  onDaySelected: (selectedDay, newFocusedDay) {
                    setState(() {
                      selectedDate = selectedDay;
                      focusedDate = newFocusedDay;
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
