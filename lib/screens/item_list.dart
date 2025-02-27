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
  List<String> _selectedTypes = [];

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
              (_selectedTypes.isEmpty ||
                  _selectedTypes.every((type) => item.type.contains(type))))
          .toList();
    });
  }

  void _toggleType(String type) {
    setState(() {
      if (_selectedTypes.contains(type)) {
        _selectedTypes.remove(type);
      } else {
        _selectedTypes.add(type);
      }
      _filterItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final types = widget.items.map((item) => item.type).toSet().toList();

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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: types.map((type) {
                final isSelected = _selectedTypes.contains(type);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: OutlinedButton(
                    onPressed: () => _toggleType(type),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: isSelected ? Colors.blue : Colors.grey,
                    ),
                    child: Text(type),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: _filteredItems.isNotEmpty
              ? ListView.builder(
                  itemCount: _filteredItems.length,
                  prototypeItem: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          child: Text(_filteredItems.first.name[0])),
                      title: Text(
                          (_filteredItems[0].name as String).capitalized()),
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
                )
              : Center(
                  child: Text("No Items Match the Query!"),
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
