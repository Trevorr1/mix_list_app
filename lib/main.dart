import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Option 1',
  'Option 2',
  'Option 3',
  'Option 4'
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Dropdown Example'),
        ),
        body: Center(
          child: DropdownExample(),
        ),
      ),
    );
  }
}

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
        SizedBox(width: 24),
        DropdownMenu<String>(
          initialSelection: list.first,
          onSelected: dropDownCallBack,
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
        SizedBox(width: 24),
        DropdownMenu<String>(
          initialSelection: list.first,
          onSelected: dropDownCallBack,
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        )
      ],
    );
  }
}
