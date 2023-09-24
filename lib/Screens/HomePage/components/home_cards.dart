import 'package:flutter/material.dart';

class HomeCards extends StatelessWidget {
  final BoxConstraints constraints;
  final String imagePath;
  final String title;
  void Function()? onPressed;
  HomeCards({
    super.key,
    required this.constraints,
    required this.imagePath,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        //color: const Color.fromRGBO(255, 255, 255, 0.6),
        child: Container(
          height: constraints.maxHeight * 0.3,
          width: constraints.maxHeight * 0.25,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.8,
                    width: constraints.maxWidth,
                    child: Image.asset(imagePath),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18 * MediaQuery.textScaleFactorOf(context),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
