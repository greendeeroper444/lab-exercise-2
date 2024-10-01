import 'package:flutter/material.dart';
import 'package:lab_exercise_2/views/styles.dart';

class CustomTextField extends StatelessWidget with Styles {
  CustomTextField( {
    super.key,
    required this.controller_,
    required this.isPassword_,
    required this.error_,
    required this.hintText_,
    required this.labelText_,
  });
  final TextEditingController controller_;
  final bool isPassword_;
  final String error_;
  final String hintText_;
  final String labelText_;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: horizontalMargin,
      child: TextFormField(
        obscureText: (isPassword_) ? true: false,
        controller: controller_,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return error_;
          }
          return null;
        },
        decoration: fieldStyle(hintText_, labelText_),
      ),
    );
  }
}