import 'package:flutter/material.dart';
import 'package:mix_list_app/controller/file_controller.dart';
import 'package:mix_list_app/models/mix_item.dart';
import 'package:mix_list_app/widget/item_list.dart';

class MixItems extends StatefulWidget {
  final FileController fileController;

  const MixItems({super.key, required this.fileController});

  @override
  State<MixItems> createState() => _MixItemsState();
}

class _MixItemsState extends State<MixItems> {
  List<MixItem> _mixItems = [];

  @override
  void initState() {
    super.initState();
    widget.fileController.readMixItemsJson().then((value) {
      setState(() {
        _mixItems = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mix Items"),
      ),
      body: ItemList( items: _mixItems), // this causes a exception because the items are not loaded yet when the widget is built
    );
  }
}
