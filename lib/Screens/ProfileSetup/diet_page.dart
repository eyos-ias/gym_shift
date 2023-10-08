import 'package:flutter/material.dart';
import 'package:gym_shift/screens/ProfileSetup/components/chip_input_textfield.dart';
import 'package:gym_shift/screens/common/components/button.dart';
import 'package:gym_shift/Core/constants/colors.dart';

class DietPage extends StatefulWidget {
  DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  List<Item> itemList = [];

  List<String> diet_list = [
    "Lactose Intolerant",
    "Vegan",
    "Gluten Free",
    "Vegetables",
    "Omnivore",
  ];

  void addToItems(String itemName) {
    if (!itemList.any((item) => item.title == itemName)) {
      setState(() {
        itemList = [...itemList, Item(title: itemName)];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Dietary Type",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(
                "assets/images/Logo.png",
                width: 250,
                height: 250,
              ),
            ),
            const Center(
              child: Text(
                "Choose your diet",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            ChipInputTextField(
              items: itemList,
              input_option: false,
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Diet Options"),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    //height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kTextColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: [
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Chip(
                        //     label: const Text("Egg"),
                        //     backgroundColor: Colors.white,
                        //   ),
                        // ),
                        ...diet_list
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    addToItems(e);
                                  },
                                  child: Chip(
                                    label: Text(e),
                                    backgroundColor: Colors.white,
                                  ),
                                ))
                            .toList()
                      ],
                    ),
                  ),
                )
              ],
            ),
            MyButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/homepage');
                },
                text: "Next")
          ],
        ),
      ),
    );
  }
}
