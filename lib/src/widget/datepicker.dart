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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$_selectedYear년 $_selectedMonth월'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPickerItem(_selectedYear - 1, '년'),
              _buildPickerItem(_selectedMonth - 1, '월'),
              _buildPickerItem(_selectedYear + 1, '년'),
              _buildPickerItem(_selectedMonth + 1, '월'),
            ],
          ),
          ElevatedButton(
            onPressed: _onDateChanged,
            child: Text('확인'),
          ),
        ],
      ),
    );
  }

  Widget _buildPickerItem(int value, String label) {
    return GestureDetector(
      onTap: () {
        if (label == '년') {
          setState(() {
            _selectedYear = value;
          });
        } else {
          setState(() {
            _selectedMonth = value;
          });
        }
      },
      child: Column(
        children: [
          Text(value.toString()),
          Text(label),
        ],
      ),
    );
  }

  void _onDateChanged() {
    DateTime selectedDate = DateTime(_selectedYear, _selectedMonth);
    widget.onDateChanged(selectedDate);
    Navigator.of(context).pop(); // DateTime picker dialog를 닫습니다.
  }
}
