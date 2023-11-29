import 'package:flutter/material.dart';

class DatePickerDay extends StatefulWidget {
  final Function(DateTime? selectedDate) onDateChanged;
  final DateTime initialDate;

  const DatePickerDay(
      {required this.onDateChanged, required this.initialDate, Key? key})
      : super(key: key);

  @override
  State<DatePickerDay> createState() => _DatePickerDayState();
}

class _DatePickerDayState extends State<DatePickerDay> {
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
          buildPickerRow(_selectedDate.year - 1, _selectedDate.month - 1),
          buildPickerRow(_selectedDate.year, _selectedDate.month,
              isBold: true, fontSize: 18.0),
          buildPickerRow(_selectedDate.year + 1, _selectedDate.month + 1),
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

  Widget buildPickerRow(int yearValue, int monthValue,
          {bool isBold = false, double fontSize = 14.0}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildPickerItem(yearValue,
              isYear: true, isBold: isBold, fontSize: fontSize),
          buildPickerItem(monthValue, isBold: isBold, fontSize: fontSize),
        ],
      );

  Widget buildPickerItem(int value,
      {bool isYear = false, bool isBold = false, double fontSize = 14.0}) {
    String displayValue = isYear
        ? value.toString()
        : (value == 0
            ? '12'
            : value == 13
                ? '1'
                : value.toString());

    return InkWell(
      onTap: () => updateSelectedDate(value, isYear: isYear),
      child: Text(
        displayValue,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
          color: isSelectable(value, isYear) ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  bool isSelectable(int value, bool isYear) {
    if (isYear) return value >= 1;
    return (value >= 0 && value <= 12) || value == 13;
  }

  void updateSelectedDate(int value, {required bool isYear}) {
    setState(() {
      if (isYear) {
        _selectedDate = DateTime(value, _selectedDate.month);
      } else {
        if (_selectedDate.month == 12 && value == 1) {
          // 12월에서 1월로 갈 때
          _selectedDate = DateTime(_selectedDate.year + 1, value);
        } else if (_selectedDate.month == 1 && value == 12) {
          // 1월에서 12월로 갈 때
          _selectedDate = DateTime(_selectedDate.year - 1, value);
        } else {
          _selectedDate = DateTime(_selectedDate.year, value);
        }
      }
    });
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
