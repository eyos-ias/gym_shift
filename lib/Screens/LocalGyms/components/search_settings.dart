import 'package:flutter/material.dart';
import 'package:gym_shift/Screens/common/components/button.dart';

import '../../../core/constants/colors.dart';

Future<void> SearchSettings(BuildContext context, BoxConstraints constraints) {
  List<String> searchMethod = ["List", "Map"];

  String currentSearchMethod = searchMethod[0];

  return showModalBottomSheet<void>(
    showDragHandle: true,
    constraints: constraints,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return MyBottomSheet(
          constraints: constraints,
          searchMethod: searchMethod,
          currentSearchMethod: currentSearchMethod);
    },
  );
}

class MyBottomSheet extends StatefulWidget {
  MyBottomSheet({
    required this.constraints,
    Key? key,
    required this.searchMethod,
    required this.currentSearchMethod,
  });
  BoxConstraints constraints;
  List<String> searchMethod;
  String currentSearchMethod;
  List<String> sort = ["rating", "date", "availability"];
  late String currentSort = sort[0];

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.constraints.maxHeight * 0.8,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.constraints.maxWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: kTextColor,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                      fontSize: 19 * MediaQuery.of(context).textScaleFactor),
                ),
                Text(
                  "United States",
                  style: TextStyle(
                      fontSize: 19 * MediaQuery.of(context).textScaleFactor),
                ),
              ],
            ),
            SizedBox(height: widget.constraints.maxHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reviews",
                  style: TextStyle(
                      fontSize: 19 * MediaQuery.of(context).textScaleFactor),
                ),
                Text(
                  "24",
                  style: TextStyle(
                      fontSize: 19 * MediaQuery.of(context).textScaleFactor),
                ),
              ],
            ),
            SizedBox(height: widget.constraints.maxHeight * 0.03),
            const Text(
              "Search Method",
              style: TextStyle(color: kPrimaryColor, fontSize: 20),
              textAlign: TextAlign.start,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  minLeadingWidth: 0,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Show Result in List"),
                  leading: Radio(
                    value: widget.searchMethod[0],
                    groupValue: widget.currentSearchMethod,
                    onChanged: (value) {
                      setState(() {
                        widget.currentSearchMethod = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Show Result in Map"),
                  leading: Radio(
                    value: widget.searchMethod[1],
                    groupValue: widget.currentSearchMethod,
                    onChanged: (value) {
                      setState(() {
                        widget.currentSearchMethod = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Divider(
                thickness: 2,
              ),
            ),

            //Sort by radio buttons
            const Text(
              "Sort By",
              style: TextStyle(color: kPrimaryColor, fontSize: 20),
              textAlign: TextAlign.start,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  minLeadingWidth: 0,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Best Gyms"),
                  leading: Radio(
                    value: widget.sort[0],
                    groupValue: widget.currentSort,
                    onChanged: (value) {
                      setState(() {
                        widget.currentSort = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("New Gyms"),
                  leading: Radio(
                    value: widget.sort[1],
                    groupValue: widget.currentSort,
                    onChanged: (value) {
                      setState(() {
                        widget.currentSort = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Available Now"),
                  leading: Radio(
                    value: widget.sort[2],
                    groupValue: widget.currentSort,
                    onChanged: (value) {
                      setState(() {
                        widget.currentSort = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            //Buttons
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Divider(
                thickness: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: "Clear",
                  color: kTextColor,
                ),
                MyButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: "Apply"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
