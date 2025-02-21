import 'package:flutter/material.dart';
import 'package:mix_list_app/models/item.dart';

class DetailView extends StatelessWidget {
  final Item item;

  DetailView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(item.description),
          ],
        ),
      ),
    );
  }
}
