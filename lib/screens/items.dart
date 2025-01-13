import 'package:flutter/material.dart';
import 'package:mix_list_app/controller/file_controller.dart';
import 'package:mix_list_app/models/item.dart';
import 'package:mix_list_app/widget/item_list.dart';

class Items extends StatefulWidget {
  final FileController fileController;

  Items({required this.fileController});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
      ),
      body: FutureBuilder<List<Item>>(
        future: widget.fileController
            .readItemsJson(), // future of the list of items
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
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
