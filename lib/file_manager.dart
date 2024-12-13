import 'dart:convert';
import 'package:flutter/services.dart';

class FileManager {
// Fetch content from the json file
  Future<String> readJson() async {
    final jsonData = await rootBundle.loadString('assets/lists/items.json');
    final parsedJson = await json.decode(jsonData);

    return parsedJson;
  }
}
