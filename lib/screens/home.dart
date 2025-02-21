import 'package:flutter/material.dart';
import 'package:mix_list_app/controller/file_controller.dart';
import 'package:mix_list_app/screens/items.dart';
import 'package:mix_list_app/screens/mix_items.dart';

// TODO: MAKE IT SO THE APP ADDAPTS TO THE SCREEN SIZE
// TODO: ADD A SEARCH BAR TO THE ITEMS AND MIX ITEMS PAGES
class Home extends StatefulWidget {
  const Home({super.key, required this.fileController});

  final FileController fileController;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Items(fileController: widget.fileController);
      case 1:
        page = MixItems(fileController: widget.fileController);
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.bolt),
                    label: Text('Items'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.science),
                    label: Text('Mix Items'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

extension StringExtension on String {
  String capitalized() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
