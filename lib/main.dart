import 'package:flutter/material.dart';
import 'package:mix_list_app/controller/file_controller.dart';
import 'package:mix_list_app/screens/home.dart';

void main() {
  runApp(
    MaterialApp(title: '', home: MyApp()),
  );
}

// TODO: Add a "Favorites" view that shows the user's favorite items (Needs favorites functionality).
// TODO: MAKE IT SO THAT THE MAIN SCREEN CONTENT IS CENTERED AND NOT STRETCHED OUT. WHEN THE SCREEN IS TOO WIDE.
// TODO: Make the top bar match the color scheme a bit and change the text color and font.
// TODO: Add an "Options" menu/ view for dark/light modes and other settings. (maybe sound?)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rikku\'s Mix List',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFDD275)),
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Color(0xFFEE9231),
        // ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF5B7C3B),
          unselectedItemColor: Color(0xFF5B7C3B).withOpacity(0.5),
        ),
      ),
      home: Home(fileController: FileController()),
    );
  }
}
