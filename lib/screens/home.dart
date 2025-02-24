import 'package:flutter/material.dart';
import 'package:mix_list_app/controller/file_controller.dart';
import 'package:mix_list_app/screens/items.dart';
import 'package:mix_list_app/screens/mix_items.dart';

// TODO: ADD ICONS AND COLOR CODES FOR ITEMS AND MIX ITEMS
// TODO: CHANGE COLOR SCHEME TO MATCH RIKKU'S FOR FUN - EXPAND TO USE CUSTOM THEME DATA, ETC.
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
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Items(fileController: widget.fileController);
      case 1:
        page = MixItems(fileController: widget.fileController);
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // TODO: add an apporopriate sliding animation transition.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceContainerHighest,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.bookmark_border),
                        activeIcon: Icon(Icons.bookmark),
                        label: 'Items',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.science_outlined),
                        activeIcon: Icon(Icons.science),
                        label: 'Mix Items',
                      )
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.bookmark_border),
                        selectedIcon: Icon(Icons.bookmark),
                        label: Text('Items'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.science_outlined),
                        selectedIcon: Icon(Icons.science),
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
                // const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}

extension StringExtension on String {
  String capitalized() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
