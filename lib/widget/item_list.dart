import 'package:flutter/material.dart';
import 'package:mix_list_app/models/item.dart';
import 'package:mix_list_app/widget/detail_view.dart';
import 'package:mix_list_app/widget/mix_detail_view.dart';

class ItemList extends StatelessWidget {
  final List<dynamic> items;

  ItemList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      prototypeItem: Card(
        child: ListTile(
          // TODO: make the height more adaptive if possible
          leading: CircleAvatar(child: Text(items.first.name[0])),
          title: Text((items[3].name as String).capitalized()),
          subtitle: Text((items[3].description as String).capitalized()),
        ),
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          key: ValueKey(item.name),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => item is Item
                      ? DetailView(item: item)
                      : MixDetailView(mixItem: item),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(child: Text(item.name[0])),
              title: Text((item.name as String).capitalized()),
              subtitle: Text((item.description as String).capitalized()),
            ),
          ),
        );
      },
    );
  }
}

extension StringExtension on String {
  String capitalized() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
