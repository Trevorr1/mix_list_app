import 'package:flutter/material.dart';
import 'package:mix_list_app/controller/file_controller.dart';
import 'package:mix_list_app/models/mix_item.dart';

class MixItems extends StatefulWidget {
  const MixItems({super.key, required this.fileController});

  final FileController fileController;

  @override
  State<MixItems> createState() => _MixItemsState();
}

class _MixItemsState extends State<MixItems> {
  // List<MixItem> _mixItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mix Items'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Mix Items',
            ),
          ],
        ),
      ),
    );
  }
}
