import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mix_list_app/models/item.dart';

class FileController {
  Future<List<Item>> readJson() async {
    final jsonString = await rootBundle.loadString('assets/lists/items.json');
    List<dynamic> parsedListJson = jsonDecode(jsonString);

    List<Item> items = parsedListJson
        .map((itemData) => Item.fromJson(itemData as Map<String, dynamic>))
        .toList();

    return items;
  }
}
