import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mix_list_app/models/mix_item.dart';
import 'package:wheel_picker/wheel_picker.dart';

class RecipeComponentPicker extends StatelessWidget {
  final List<String> components;

  const RecipeComponentPicker({super.key, required this.components});

  @override
  Widget build(BuildContext context) {
    final controller = WheelPickerController(itemCount: components.length);
    const textStyle = TextStyle(fontSize: 32, height: 1.5);

    return SizedBox(
      height: 200,
      child: WheelPicker(
        builder: (context, index) => Text(components[index], style: textStyle),
        controller: controller,
        selectedIndexColor: Colors.blue,
        onIndexChanged: (index, _) {
          print("On index $index");
        },
        style: WheelPickerStyle(
          itemExtent: textStyle.fontSize! * textStyle.height!, // Text height
          squeeze: 1.25,
          diameterRatio: .8,
          surroundingOpacity: .25,
          magnification: 1.2,
        ),
        looping: false, // Disable looping to prevent rollover
      ),
    );
  }
}

class MixDetailView extends StatelessWidget {
  final MixItem mixItem;

  MixDetailView({required this.mixItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mixItem.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mixItem.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              mixItem.type,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 8),
            Text(mixItem.description),
            SizedBox(
                height:
                    8), // TODO: Make it so there are two pickers side by side/ one for bases and and updating one for the adds
            RecipeComponentPicker(
              // TODO: Use as SET of recipe components based on mixItem.recipes bases
              components: [
                'Component 1',
                'Component 2',
                'Component 3',
                'Component 4'
              ],
            )
          ],
        ),
      ),
    );
  }
}
