import 'package:flutter/material.dart';

List<String> options = <String>['Boy', 'Girl', 'Gay', 'Lesbian'];

class DropdownExample extends StatefulWidget {
  final ValueChanged<String> onSelected;

  const DropdownExample({super.key, required this.onSelected});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String dropdownValue = options.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownMenu<String>(
          label: const Text('Select Gender'),
          width: 300,
          initialSelection: options.first,
          onSelected: (String? value) {
            setState(() {
              dropdownValue = value!;
              widget.onSelected(dropdownValue);
            });
          },
          dropdownMenuEntries:
          options.map<DropdownMenuEntry<String>>((String value_) {
            return DropdownMenuEntry<String>(value: value_, label: value_);
          }).toList(),
        ),
        const SizedBox(height: 20),
        Text('Selected Gender: $dropdownValue'),
      ],
    );
  }
}
