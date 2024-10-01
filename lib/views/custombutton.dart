import 'package:flutter/material.dart';
import 'package:lab_exercise_2/views/styles.dart';

class CustomButton extends StatelessWidget with Styles{
  CustomButton({
    super.key,
    required this.btnText_,
    required this.onPressed_,
  });

  final String btnText_;
  final Function() onPressed_;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: buttonMargin,
      child: ElevatedButton.icon(
        style: btnStyle(standardColor),
        onPressed: onPressed_,
        icon: const Icon(Icons.arrow_forward),
        label: Text(btnText_),
      ),
    );
  }
}
