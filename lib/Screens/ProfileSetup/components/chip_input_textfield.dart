import 'package:flutter/material.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';

class ChipInputTextField extends StatefulWidget {
  @override
  _ChipInputTextFieldState createState() => _ChipInputTextFieldState();
}

class _ChipInputTextFieldState extends State<ChipInputTextField> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Item> _items = [];

  void _showModalInput(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add an allergy"),
          content: TextField(
            controller: _textEditingController,
            decoration:
                InputDecoration(hintText: "Enter chips separated by spaces"),
            onSubmitted: (input) {
              final chips = input.split(' ');
              chips.forEach((chip) {
                if (chip.isNotEmpty) {
                  setState(() {
                    _items.add(Item(title: chip));
                  });
                }
              });
              Navigator.of(context).pop();
              _textEditingController.clear();
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Add"),
              onPressed: () {
                final input = _textEditingController.text.trim();
                final chips = input.split(' ');
                chips.forEach((chip) {
                  if (chip.isNotEmpty) {
                    setState(() {
                      _items.add(Item(title: chip));
                    });
                  }
                });
                Navigator.of(context).pop();
                _textEditingController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: _items.map((item) {
                    return Chip(
                      label: Text(item.title),
                      deleteIcon: const Icon(Icons.cancel),
                      onDeleted: () {
                        setState(() {
                          _items.remove(item);
                        });
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _showModalInput(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String title;

  Item({required this.title});
}
