import 'package:flutter/material.dart';
import 'package:mix_list_app/main.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String selectedValue = list.first;

  void dropDownCallBack(String? newValue) {
    if (newValue is String) {
      setState(() {
        selectedValue = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownMenu<String>(
          initialSelection: list.first,
          onSelected: dropDownCallBack,
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
        SizedBox(width: 12),
        DropdownMenu<String>(
          initialSelection: list.first,
          onSelected: dropDownCallBack,
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      ],
    );
  }
}
