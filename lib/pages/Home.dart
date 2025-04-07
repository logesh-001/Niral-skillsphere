import 'package:flutter/material.dart';
import 'package:skillsphere/Data/Data.dart';
import 'package:skillsphere/widgets/course.dart';
import 'package:skillsphere/widgets/home_slider.dart';
import 'package:skillsphere/widgets/widgetsele.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "Loki";

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 **Stack for AppBar & Overlay Widget**
            Stack(
              clipBehavior: Clip.none,
              children: [
                PreferredSize(
                  preferredSize: Size.fromHeight(deviceHeight * 0.18),
                  child: AppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, $name",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(
                          "Let's start learning",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: const Color(0xFFFF3D40),
                    toolbarHeight: deviceHeight * 0.18,
                    actions: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            "assets/images/Avatar.jpg",
                          ),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                /// 🔹 **Overlaying Widget**
                Positioned(
                  top: deviceHeight * 0.18, // Adjust for overlay
                  left: deviceWidth * 0.05,
                  right: deviceWidth * 0.05,
                  child: today(
                    context,
                    45,
                    deviceHeight * 0.15,
                    deviceWidth * 0.9,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            /// 🔹 **Horizontal Scrolling Home Slider**
            SizedBox(
              height: deviceHeight * 0.25, // Adjust height for better layout
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      sliderData.map((item) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ), // Left margin
                          child: HomeSlider(context, item.text, item.imagePath),
                        );
                      }).toList(),
                ),
              ),
            ),

            /// 🔹 **Learning Plan Title**
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Learning Plan",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /// 🔹 **Fixed-Height ListView to Avoid Scroll Issues**
            SizedBox(
              height:
                  deviceHeight * 0.15, // Increased height for better scrolling
              child: ListView(
                shrinkWrap: true,
                children:
                    courses.map((course) {
                      return CourseProgressTile(
                        title: course.title,
                        progress: course.prog,
                        total: course.total,
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
