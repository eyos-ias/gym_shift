import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

Future<void> SearchSettings(BuildContext context, BoxConstraints constraints) {
  List<String> searchMethod = ["List", "Map"];
  List<String> sort = ["rating", "date", "availability"];
  String currentSearchMethod = searchMethod[0];
  String currentSort = sort[0];

  return showModalBottomSheet<void>(
    showDragHandle: true,
    //constraints: constraints,
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
    super.key,
    required this.searchMethod,
    required this.currentSearchMethod,
  });
  BoxConstraints constraints;
  final List<String> searchMethod;
  final String currentSearchMethod;

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.constraints.maxHeight * 0.7,
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
                    onChanged: (value) {},
                  ),
                ),
                Radio(
                  value: widget.searchMethod[1],
                  groupValue: widget.currentSearchMethod,
                  onChanged: (value) {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
