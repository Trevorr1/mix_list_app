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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mixed Items"),
      ),
      body: FutureBuilder<List<MixItem>>(
        future: widget.fileController
            .readMixItemsJson(), // future of the list of mixed items
        builder: (BuildContext context, AsyncSnapshot<List<MixItem>> snapshot) {
          if (snapshot.hasData) {
            return ItemList(items: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
