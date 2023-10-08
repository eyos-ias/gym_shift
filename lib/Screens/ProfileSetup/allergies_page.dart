import 'package:flutter/material.dart';
import 'package:gym_shift/screens/ProfileSetup/components/chip_input_textfield.dart';
import 'package:gym_shift/screens/ProfileSetup/diet_page.dart';
import 'package:gym_shift/screens/common/components/button.dart';
import 'package:gym_shift/Core/constants/colors.dart';

class AllergiesPage extends StatefulWidget {
  AllergiesPage({super.key});

  @override
  State<AllergiesPage> createState() => _AllergiesPageState();
}

class _AllergiesPageState extends State<AllergiesPage> {
  List<Item> itemList = [];

  List<String> recommendations_list = [
    "Egg",
    "Milk",
    "Peanuts",
    "Tree Nuts",
    "Fish",
    "Shellfish",
    "Wheat",
    "Soy"
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
          "Allergies Food",
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
                "Add your allergies food",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            ChipInputTextField(
              items: itemList,
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Recommended for you"),
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
                        ...recommendations_list
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
                  //  Navigator.popAndPushNamed(context, '/homepage');
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DietPage()));
                },
                text: "Next")
          ],
        ),
      ),
    );
  }
}
