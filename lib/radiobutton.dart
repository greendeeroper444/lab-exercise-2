import 'package:flutter/material.dart';

final List<String> options = [
  'Single', 'Married', 'Divorced', 'Widowed'
];

class RadioButton extends StatefulWidget {
  final Function(String) onChanged;
  const RadioButton({super.key, required this.onChanged});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String selectedOption = options.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: options.map((option) {
        return RadioListTile<String>(
          title: Text(option),
          value: option,
          groupValue: selectedOption,
          onChanged: (String? value) {
            setState(() {
              selectedOption = value!;
            });
            widget.onChanged(selectedOption);
          },
        );
      }).toList(),
    );
  }
}