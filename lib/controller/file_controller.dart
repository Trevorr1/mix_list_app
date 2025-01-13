import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mix_list_app/models/item.dart';
import 'package:mix_list_app/models/mix_item.dart';

class FileController {
  Future<List<dynamic>> parseJsonFile(String path) async {
    final jsonString = await rootBundle.loadString(path);
    return jsonDecode(jsonString);
  }

  Future<List<Item>> readItemsJson() async {
    List<dynamic> parsedListJson =
        await parseJsonFile('assets/lists/items.json');

    List<Item> items = parsedListJson
        .map((itemData) => Item.fromJson(itemData as Map<String, dynamic>))
        .toList();

    print("Items loaded with ${items.length} items.");

    return items;
  }

  Future<List<MixItem>> readMixItemsJson() async {
    final List<String> files = [
      'assets/lists/water_recipes.json',
      'assets/lists/thunder_recipes.json',
      'assets/lists/special_recipes.json',
      'assets/lists/non_elemental_recipes.json',
      'assets/lists/ice_recipes.json',
      'assets/lists/fire_recipes.json',
      'assets/lists/curative_recipes.json'
    ];

    List<MixItem> mixItems = [];
    for (String file in files) {
      // final String response = await rootBundle.loadString(file);
      // final data = await json.decode(response) as List;

      List<dynamic> parsedListJson = await parseJsonFile(file);

      mixItems.addAll(parsedListJson
          .map((mixItem) => MixItem.fromJson(mixItem as Map<String, dynamic>))
          .toList());
    }

    print("Mix Items loaded with ${mixItems.length} items.");

    return mixItems;
  }
}
