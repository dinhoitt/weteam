import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime? selectedDate) onDateChanged;
  final DateTime initialDate;

  DatePicker({required this.onDateChanged, required this.initialDate});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late int _selectedYear;
  late int _selectedMonth;

  @override
  void initState() {
    super.initState();
    _selectedYear = widget.initialDate.year;
    _selectedMonth = widget.initialDate.month;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '$_selectedYear년 $_selectedMonth월',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPickerItem(_selectedYear - 1, color: Colors.grey),
              _buildPickerItem(_selectedMonth - 1, color: Colors.grey),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPickerItem(_selectedYear, isBold: true, fontSize: 18.0),
              _buildPickerItem(_selectedMonth, isBold: true, fontSize: 18.0),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPickerItem(_selectedYear + 1, color: Colors.grey),
              _buildPickerItem(_selectedMonth + 1, color: Colors.grey),
            ],
          ),
          ElevatedButton(
            onPressed: _onDateChanged,
            child: Text(
              '완료',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickerItem(int value,
      {bool isBold = false, double fontSize = 14.0, Color? color}) {
    return InkWell(
      onTap: () {
        if (value <= 12) {
          setState(() {
            _selectedMonth = value;
          });
        } else {
          setState(() {
            _selectedYear = value;
          });
        }
      },
      child: Text(
        value.toString(),
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }

  void _onDateChanged() {
    DateTime selectedDate = DateTime(_selectedYear, _selectedMonth);
    widget.onDateChanged(selectedDate);
    Navigator.of(context).pop();
  }
}
