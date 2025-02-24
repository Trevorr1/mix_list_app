import 'package:flutter/material.dart';
import 'package:mix_list_app/controller/file_controller.dart';
import 'package:mix_list_app/screens/home.dart';

void main() {
  runApp(
    MaterialApp(title: '', home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rikku\'s Mix List',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFDD275)),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFEE9231),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF5B7C3B),
          unselectedItemColor: Color(0xFF5B7C3B).withOpacity(0.5),
        ),
      ),
      home: Home(fileController: FileController()),
    );
  }
}
