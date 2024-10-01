import 'package:flutter/material.dart';

final List<String> options = ['IT415', 'Science', 'English', 'History'];
List<bool> isChecked = List.generate(options.length, (index) => false);

class CheckBox extends StatefulWidget {
  final Function(List<String>) onChanged;
  const CheckBox({super.key, required this.onChanged});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  List<String> selectedCodes = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (context, index) {
        return CheckboxListTile(
          title: Text(options[index]),
          value: isChecked[index],
          onChanged: (bool? value) {
            setState(() {
              isChecked[index] = value ?? false;
              if (isChecked[index]) {
                selectedCodes.add(options[index]);
              } else {
                selectedCodes.remove(options[index]);
              }
              widget.onChanged(selectedCodes);
            });
          },
        );
      },
    );
  }
}
