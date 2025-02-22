import 'package:flutter/material.dart';
import 'package:mix_list_app/models/mix_item.dart';

class MixDetailView extends StatefulWidget {
  final MixItem mixItem;

  MixDetailView({required this.mixItem});

  @override
  State<MixDetailView> createState() => _MixDetailViewState();
}

class _MixDetailViewState extends State<MixDetailView> {
  String selectedBase = '';
  List<String> filteredAddComponents = [];

  @override
  void initState() {
    super.initState();
    if (widget.mixItem.recipes.isNotEmpty) {
      selectedBase = widget.mixItem.recipes.first.base;
      updateAddComponents();
    }
  }

  void updateAddComponents() {
    setState(() {
      filteredAddComponents = widget.mixItem.recipes
          .where((recipe) =>
              recipe.base.toLowerCase() == selectedBase.toLowerCase())
          .map((recipe) => recipe.add)
          .toSet()
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Extract the unique base components of the mixItem's recipes
    final baseComponents =
        widget.mixItem.recipes.map((recipe) => recipe.base).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mixItem.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.mixItem.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.mixItem.type,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(widget.mixItem.description),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedBase,
              items: baseComponents
                  .map((base) => DropdownMenuItem(
                        value: base,
                        child: Text(base),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedBase = value!;
                  updateAddComponents();
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Base',
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: ListView(
                children: filteredAddComponents
                    .map((filteredItem) => ListTile(
                          title: Text(filteredItem),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
