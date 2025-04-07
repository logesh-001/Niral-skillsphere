import 'package:flutter/material.dart';

@override
Widget HomeSlider(BuildContext context, String text, String img) {
  final double deviceHeight = MediaQuery.of(context).size.height;
  final double deviceWidth = MediaQuery.of(context).size.width;

  return Container(
    width: deviceWidth * 0.9,
    height: deviceHeight * 0.2,
    padding: const EdgeInsets.all(16), // Added padding for spacing
    decoration: BoxDecoration(
      color: const Color(0xFFCEECFE),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: deviceWidth * 0.35, // Adjust width to fit
            child: Image.asset(img, fit: BoxFit.contain),
          ),
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Get Started")),
          ],
        ),
      ],
    ),
  );
}
