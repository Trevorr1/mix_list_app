import 'package:flutter/material.dart';
import 'package:mix_list_app/controller/file_controller.dart';
import 'package:mix_list_app/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => FileController())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<FileController>().readText();
    return MaterialApp(
      home: Home(),
    );
  }
}
