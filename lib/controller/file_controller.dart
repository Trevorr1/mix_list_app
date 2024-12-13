import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mix_list_app/file_manager.dart';
import 'package:mix_list_app/models/item.dart';

class FileController extends ChangeNotifier {
  late List<Item> itemList;

  void readJson() async {
    final jsonString = await FileManager().readJson();
    List<dynamic> parsedListJson = jsonDecode(jsonString);

    List<Item> items = parsedListJson
        .map((itemData) => Item.fromJson(itemData as Map<String, dynamic>))
        .toList();

    itemList = items;

    notifyListeners();
  }
}
