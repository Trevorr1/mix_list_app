import 'package:flutter/foundation.dart';
import 'package:mix_list_app/file_manager.dart';

class FileController extends ChangeNotifier{
  late String _text;

  String get text => _text;

  readText() async {
    _text = await FileManager().readTextFile();

    notifyListeners();
  }

writeText() async {
  _text = await FileManager().writeTextFile();

  notifyListeners();
}
}