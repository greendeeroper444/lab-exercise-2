import 'package:flutter/material.dart';
import 'package:lab_exercise_2/checkbox.dart';
import 'package:lab_exercise_2/datepickerexample.dart';
import 'package:lab_exercise_2/dropdownexample.dart';
import 'package:lab_exercise_2/homepage.dart';
import 'package:lab_exercise_2/radiobutton.dart';
import 'package:lab_exercise_2/timepickerexample.dart';
import 'package:lab_exercise_2/views/customfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _selectedGender = '';
  String _selectedCivilStatus = '';
  List<String> _subjectCodes = [];
  String _birthDate = '';
  String _tuesdayClassSchedule = '';
  String _thursdayClassSchedule = '';

  String _fullName = '';
  String _password = '';

  void _submitForm() {
    setState(() {
      _fullName = _fullNameController.text;
      _password = _passwordController.text;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          selectedGender: _selectedGender,
          selectedCivilStatus: _selectedCivilStatus,
          subjectCodes: _subjectCodes,
          birthDate: _birthDate,
          tuesdayClassSchedule: _tuesdayClassSchedule,
          thursdayClassSchedule: _thursdayClassSchedule,
          fullName: _fullName,
          password: _password,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomTextField(
                controller_: _fullNameController,
                isPassword_: false,
                error_: "Full Name is required",
                hintText_: "Enter your full name",
                labelText_: "Full Name",
              ),
              const SizedBox(height: 16),

              CustomTextField(
                controller_: _passwordController,
                isPassword_: true,
                error_: "Password is required",
                hintText_: "Enter your password",
                labelText_: "Password",
              ),
              const SizedBox(height: 16),


              DropdownExample(
                onSelected: (String value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              const SizedBox(height: 16),


              RadioButton(
                onChanged: (String value) {
                  setState(() {
                    _selectedCivilStatus = value;
                  });
                },
              ),
              const SizedBox(height: 16),


              CheckBox(
                onChanged: (List<String> selectedCodes) {
                  setState(() {
                    _subjectCodes = selectedCodes;
                  });
                },
              ),
              const SizedBox(height: 16),


              DatePickerExample(
                onDateSelected: (String date) {
                  setState(() {
                    _birthDate = date;
                  });
                },
              ),
              const SizedBox(height: 16),

              const Text('Class Schedule (in):'),
              TimePickerExample(
                onTimeSelected: (String time) {
                  setState(() {
                    _tuesdayClassSchedule = time;
                  });
                },
              ),
              const SizedBox(height: 16),

              const Text('Class Schedule (out):'),
              TimePickerExample(
                onTimeSelected: (String time) {
                  setState(() {
                    _thursdayClassSchedule = time;
                  });
                },
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
