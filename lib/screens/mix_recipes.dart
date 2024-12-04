import 'package:flutter/material.dart';
import 'package:mix_list_app/widget/dropdown_example.dart';

class MixRecipes extends StatelessWidget {
  const MixRecipes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dropdown Example'),
      ),
      body: Center(
        child: DropdownExample(),
      ),
    );
  }
}
