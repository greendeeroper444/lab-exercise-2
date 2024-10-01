import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerExample extends StatefulWidget {
  final Function(String) onTimeSelected;
  const TimePickerExample({super.key, required this.onTimeSelected});

  @override
  _TimePickerExampleState createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Format the selected time
      final now = DateTime.now();
      final DateTime selectedTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      String formattedTime = DateFormat('hh:mm a').format(selectedTime);
      setState(() {
        _timeController.text = formattedTime;
      });

      widget.onTimeSelected(formattedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _timeController,
      readOnly: true,
      onTap: () {
        _selectTime(context);
      },
      decoration: const InputDecoration(
        labelText: 'Class Schedule',
        hintText: 'Select class time',
      ),
    );
  }
}
