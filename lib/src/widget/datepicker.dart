import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime? selectedDate) onDateChanged;
  final DateTime initialDate;

  const DatePicker(
      {required this.onDateChanged, required this.initialDate, Key? key})
      : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      contentPadding: const EdgeInsets.only(top: 5.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildDateDisplay(),
          buildPickerRow(_selectedDate.year - 1, _selectedDate.month - 1,
              _selectedDate.day - 1),
          buildPickerRow(
              _selectedDate.year, _selectedDate.month, _selectedDate.day,
              isBold: true, fontSize: 18.0),
          buildPickerRow(_selectedDate.year + 1, _selectedDate.month + 1,
              _selectedDate.day + 1),
          buildActionButtons(),
        ],
      ),
    );
  }

  Widget buildDateDisplay() => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(
          '${_selectedDate.year}년 ${_selectedDate.month}월',
          style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      );

  Widget buildPickerRow(int yearValue, int monthValue, int dayValue,
      {bool isBold = false, double fontSize = 14.0}) {
    // Calculate the last day of the selected month
    int lastDayOfCurrentMonth = getLastDayOfMonth(yearValue, monthValue);

    // Adjust the day values for wrapping
    int nextDayValue = dayValue >= lastDayOfCurrentMonth ? 1 : dayValue + 1;
    int nextMonthValue =
        dayValue >= lastDayOfCurrentMonth ? monthValue % 12 + 1 : monthValue;
    int nextYearValue = monthValue == 12 && dayValue >= lastDayOfCurrentMonth
        ? yearValue + 1
        : yearValue;

    // Build the row with the year, month, and day values
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildPickerItem(yearValue,
            isYear: true, isBold: isBold, fontSize: fontSize),
        buildPickerItem(monthValue,
            isMonth: true, isBold: isBold, fontSize: fontSize),
        buildPickerItem(dayValue, isBold: isBold, fontSize: fontSize),
        // If the day is the last day of the month, show the first day of the next month
        if (dayValue == lastDayOfCurrentMonth)
          buildPickerItem(nextDayValue,
              isBold: isBold,
              fontSize: fontSize,
              isNextMonth: true,
              nextMonthValue: nextMonthValue,
              nextYearValue: nextYearValue),
      ],
    );
  }

  Widget buildPickerItem(int value,
      {bool isYear = false,
      bool isMonth = false,
      bool isBold = false,
      double fontSize = 14.0,
      bool isNextMonth = false,
      int nextMonthValue = 0,
      int nextYearValue = 0}) {
    return InkWell(
      onTap: () {
        if (isNextMonth) {
          updateSelectedDate(1,
              isYear: false,
              isMonth: true,
              monthValue: nextMonthValue,
              yearValue: nextYearValue);
        } else if (isSelectable(value, isYear, isMonth)) {
          updateSelectedDate(value, isYear: isYear, isMonth: isMonth);
        }
      },
      child: Text(
        value.toString(),
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
          color: isSelectable(value, isYear, isMonth) || isNextMonth
              ? Colors.black
              : Colors.grey,
        ),
      ),
    );
  }

  bool isSelectable(int value, bool isYear, bool isMonth) {
    if (isYear) {
      return value >= DateTime.now().year - 100 &&
          value <= DateTime.now().year + 100;
    } else if (isMonth) {
      return value >= 1 && value <= 12;
    } else {
      int lastDay = getLastDayOfMonth(_selectedDate.year, _selectedDate.month);
      return value >= 1 && value <= lastDay;
    }
  }

  void updateSelectedDate(int value,
      {required bool isYear,
      required bool isMonth,
      int? monthValue,
      int? yearValue}) {
    setState(() {
      int year = yearValue ?? _selectedDate.year;
      int month = monthValue ?? _selectedDate.month;
      int day = _selectedDate.day;

      if (isYear) {
        // Update the year value
        _selectedDate = DateTime(value, month, day);
      } else if (isMonth) {
        // Update the month value and handle the day wrapping if necessary
        if (day > getLastDayOfMonth(year, value)) {
          day = 1; // Wrap to the first day of the next month
          month += 1; // Increment the month
          if (month > 12) {
            month = 1; // Wrap to January
            year += 1; // Increment the year
          }
        }
        _selectedDate = DateTime(year, value, day);
      } else {
        // Update the day value
        if (value > getLastDayOfMonth(year, month)) {
          day = 1; // Wrap to the first day of the next month
          month += 1; // Increment the month
          if (month > 12) {
            month = 1; // Wrap to January
            year += 1; // Increment the year
          }
        } else {
          day = value; // Set day to selected value
        }
        _selectedDate = DateTime(year, month, day);
      }
    });
  }

  int getLastDayOfMonth(int year, int month) {
    DateTime beginningNextMonth =
        (month < 12) ? DateTime(year, month + 1, 1) : DateTime(year + 1, 1, 1);
    return beginningNextMonth.subtract(const Duration(days: 1)).day;
  }

  Widget buildActionButtons() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildActionButton('취소', () => Navigator.pop(context, true)),
            buildActionButton('완료', _onDateChanged),
          ],
        ),
      );

  Widget buildActionButton(String text, VoidCallback onPressed) => Expanded(
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white, elevation: 0.0),
          child: Text(text, style: const TextStyle(color: Colors.black)),
        ),
      );

  void _onDateChanged() {
    widget.onDateChanged(_selectedDate);
    Navigator.of(context).pop();
  }
}
