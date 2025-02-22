import 'package:flutter/material.dart';
import 'package:mix_list_app/models/item.dart';
import 'package:mix_list_app/screens/detail_view.dart';
import 'package:mix_list_app/screens/mix_detail_view.dart';

class ItemList extends StatefulWidget {
  final List<dynamic> items;

  ItemList({required this.items});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  TextEditingController _searchController = TextEditingController();
  FocusNode fieldFocusNode = FocusNode();
  List<dynamic> _filteredItems = [];
  String? _selectedType;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = widget.items
          .where((item) =>
              item.name.toLowerCase().contains(query) &&
              (_selectedType == null || item.type == _selectedType))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Extract the unique types of the items
    final types = widget.items.map((item) => item.type).toSet().toList();
    types.insert(0, 'ALL');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            focusNode: fieldFocusNode,
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Select Type',
              border: OutlineInputBorder(),
            ),
            hint: Text('Select Type'),
            value: _selectedType,
            items: types
                .map<DropdownMenuItem<String>>((type) => DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                if (value == 'ALL') {
                  _selectedType = null;
                } else {
                  _selectedType = value;
                }
                _filterItems();
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredItems.length,
            prototypeItem: Card(
              child: ListTile(
                leading:
                    CircleAvatar(child: Text(_filteredItems.first.name[0])),
                title: Text((_filteredItems[0].name as String).capitalized()),
                subtitle: Text(
                  (_filteredItems[0].description as String).capitalized(),
                  overflow: TextOverflow.ellipsis,
                ),
                isThreeLine: true,
              ),
            ),
            itemBuilder: (context, index) {
              final item = _filteredItems[index];
              return Card(
                key: ValueKey(item.name),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => item is Item
                            ? DetailView(item: item)
                            : MixDetailView(mixItem: item),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(child: Text(item.name[0])),
                    title: Text((item.name as String).capitalized()),
                    subtitle: Text(
                      (item.description as String).capitalized(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    isThreeLine: true,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalized() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
