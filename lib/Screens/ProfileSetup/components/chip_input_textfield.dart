import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';
//import 'package:flutter_tags_x/flutter_tags_x.dart';

class ChipInputTextField extends StatefulWidget {
  final List<Item> items;

  ChipInputTextField({Key? key, required this.items}) : super(key: key);
  @override
  _ChipInputTextFieldState createState() => _ChipInputTextFieldState();
}

class _ChipInputTextFieldState extends State<ChipInputTextField> {
  final TextEditingController _textEditingController = TextEditingController();
  //final List<Item> _items = [];

  void _showModalInput(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add an allergy"),
          content: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(hintText: "Allergy name"),
            onSubmitted: (input) {
              final chips = input.split(' ');
              for (var chip in chips) {
                if (chip.isNotEmpty) {
                  setState(() {
                    widget.items.add(Item(title: chip));
                  });
                }
              }
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
                      widget.items.add(Item(title: chip));
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
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(),
          //color: kPrimaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: widget.items.map((item) {
                return Chip(
                  backgroundColor: kPrimaryColor.withOpacity(0.2),
                  label: Text(item.title),
                  deleteIcon: const Icon(
                    Icons.cancel,
                    color: kPrimaryColor,
                  ),
                  onDeleted: () {
                    setState(() {
                      widget.items.remove(item);
                    });
                  },
                );
              }).toList(),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }
}

class Item {
  final String title;

  Item({required this.title});
}
