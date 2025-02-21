import 'package:flutter/material.dart';

class SearchDropdown extends StatefulWidget {
  @override
  State<SearchDropdown> createState() => _SearchDropdownState();
}

class _SearchDropdownState extends State<SearchDropdown> {
  String? selectedType;
  String searchQuery = '';
  List<String> allItems = [
    'All',
    'Type1',
    'Type2',
    'Type3'
  ]; // TODO: Make it so the class accepts lists that than can be used instead of test data
  List<String> filteredItems = [];
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;

    // Listen for changes in focus to hide the overlay when unfocused
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _removeOverlay();
      }
    });
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (filteredItems.isEmpty) {
        filteredItems.add('No items found');
      }
    });

    _showOverlay();
  }

  void _showOverlay() {
    // Remove the overlay if it already exists
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
    }

    // Create a new overlay entry
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        top: offset.dy + size.height,
        left: offset.dx,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5),
          child: Material(
            elevation: 4.0,
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: filteredItems
                    .map((item) => ListTile(
                          title: Text(item),
                          onTap: () {
                            if (item != 'No items found') {
                              setState(() {
                                selectedType = item;
                                _controller.text = item;
                              });
                              _removeOverlay();
                            }
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            focusNode: _focusNode,
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
            onTap: () => _showOverlay(),
            onChanged: (value) => _filterItems(value),
          ),
          SizedBox(height: 10),
          if (selectedType != null)
            Text('Selected type: $selectedType',
                style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
