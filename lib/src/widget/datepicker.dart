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
      contentPadding: EdgeInsets.only(top: 5.0),
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
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text(
                      '취소',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                      elevation: 0.0,
                      primary: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: _onDateChanged,
                    child: Text(
                      '완료',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                      elevation: 0.0,
                      primary: Colors.white,
                    ),
                  ),
                ),
              ],
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
        setState(() {
          if (value == 0 || value == 13) {
            _selectedMonth = (value == 13) ? 1 : 12;
            _selectedYear += (value == 13) ? 1 : -1;
          } else if (value > 0 && value <= 12) {
            _selectedMonth = value;
          } else {
            _selectedYear = value;
          }
        });
      },
      child: Text(
        (_selectedMonth == 12 && value == 13)
            ? '1'
            : (_selectedMonth == 1 && value == 0)
                ? '12'
                : value.toString(),
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
