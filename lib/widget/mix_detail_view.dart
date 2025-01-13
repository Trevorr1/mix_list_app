import 'package:flutter/material.dart';
import 'package:mix_list_app/models/mix_item.dart';

class MixDetailView extends StatelessWidget {
  final MixItem mixItem;

  MixDetailView({required this.mixItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mixItem.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mixItem.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              mixItem.type,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 8),
            Text(mixItem.description),
          ],
        ),
      ),
    );
  }
}
