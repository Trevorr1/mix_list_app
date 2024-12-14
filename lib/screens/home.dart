import 'package:flutter/material.dart';
import 'package:mix_list_app/controller/file_controller.dart';
import 'package:mix_list_app/models/item.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.fileController});

  final FileController fileController;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    widget.fileController.readJson().then((value) {
      setState(() {
        _items = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rikku's Mix List"),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        prototypeItem: ListTile(
          title: Text(_items.first.name),
        ),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(_items[index].name[0])),
              title: Text(_items[index].name.capitalized()),
              subtitle: Text(_items[index].description.capitalized()),
            ),
          );
        },
      ),
    );
  }
}

extension StringExtension on String {
  String capitalized() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
