import 'package:flutter/material.dart';
import 'package:gym_shift/core/constants/colors.dart';

class GoalTile extends StatefulWidget {
  String? title;
  Icon? icon;
  GoalTile({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  State<GoalTile> createState() => _GoalTileState();
}

class _GoalTileState extends State<GoalTile> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        elevation: _isSelected ? 5.0 : 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: _isSelected ? kPrimaryColor : Colors.transparent,
              width: 2.0,
            ),
            // color: _isSelected ? Colors.grey[300] : Colors.transparent,
          ),
          width: 50,
          height: 50,
          child: SizedBox(
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                widget.icon!,
                Text(widget.title!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
