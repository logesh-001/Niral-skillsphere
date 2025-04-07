import 'package:flutter/material.dart';
import 'package:skillsphere/pages/Bottomnavbar.dart';
import 'package:skillsphere/pages/Coursepage.dart';

Widget today(BuildContext context, int min, double height, double widget) {
  return Container(
    height: height,
    width: widget,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Learned today"),
                    Row(
                      children: [
                        Text(
                          "$min",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text("/ 60 min"),
                      ],
                    ),
                    SizedBox(height: 8), // Spacing
                    // Progress Bar
                    Container(
                      width: 196, // Adjust width as needed
                      child: LinearProgressIndicator(
                        value: min / 60, // Normalized progress
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Text("My learnings"),
                onTap: () {
                  if (BottomNavbar.bottomNavbarKey.currentState != null) {
                    BottomNavbar.bottomNavbarKey.currentState!.onItemTapped(1);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
