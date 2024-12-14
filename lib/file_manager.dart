import 'package:flutter/services.dart';

class FileManager {
// Fetch content from the json file
  Future<String> readJson() async {
    final jsonString = await rootBundle.loadString('assets/lists/items.json');

    return jsonString;
  }
}
