import 'package:flutter/material.dart';
import 'package:mix_list_app/controller/file_controller.dart';
import 'package:mix_list_app/screens/home.dart';

void main() {
  // debugPaintSizeEnabled = false;
  runApp(
    MyApp(),
  );
}

// TODO: Add a "Favorites" view that shows the user's favorite items (Needs favorites functionality).
// TODO: MAKE IT SO THAT THE MAIN SCREEN CONTENT IS CENTERED AND NOT STRETCHED OUT. WHEN THE SCREEN IS TOO WIDE.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rikku\'s Mix List',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF5B7C3B)),
      ),
      home: Home(fileController: FileController()),
      debugShowCheckedModeBanner: false,
    );
  }
}
