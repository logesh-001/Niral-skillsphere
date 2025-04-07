import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Coursepage(),
    );
  }
}

class Course {
  final String title;
  final int completedLessons;
  final int totalLessons;
  final Color color;

  Course({
    required this.title,
    required this.completedLessons,
    required this.totalLessons,
    required this.color,
  });
}

class _CoursepageState extends State<Coursepage> {
  final int minutesSpentToday = 46;
  final int totalMinutesToday = 60;

  final List<Course> courses = [
    Course(
      title: "Product Design v1.0",
      completedLessons: 14,
      totalLessons: 24,
      color: Colors.pink.shade100,
    ),
    Course(
      title: "Java Development",
      completedLessons: 12,
      totalLessons: 18,
      color: Colors.blue.shade100,
    ),
    Course(
      title: "Visual Design",
      completedLessons: 10,
      totalLessons: 16,
      color: Colors.teal.shade100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Today's Learning Progress
                  Text(
                    'Learned today',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  RichText(
                    text: TextSpan(
                      text: '$minutesSpentToday',
                      style: TextStyle(
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: ' / $totalMinutesToday min',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  LinearProgressIndicator(
                    value: minutesSpentToday / totalMinutesToday,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.orange,
                    minHeight: screenHeight * 0.01,
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Course Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isPortrait ? 2 : 3,
                      crossAxisSpacing: screenWidth * 0.04,
                      mainAxisSpacing: screenHeight * 0.02,
                      childAspectRatio: isPortrait ? 0.8 : 1.1,
                    ),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      final course = courses[index];
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.04,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: course.color,
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.04,
                            ),
                          ),
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Course Title
                              Text(
                                course.title,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              // Progress Bar and Completion Status
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LinearProgressIndicator(
                                    value:
                                        course.completedLessons /
                                        course.totalLessons,
                                    backgroundColor: Colors.white.withOpacity(
                                      0.5,
                                    ),
                                    color: Colors.black54,
                                    minHeight: screenHeight * 0.01,
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Completed',
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        '${course.completedLessons}/${course.totalLessons}',
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              // Play Button
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: screenWidth * 0.045,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: course.color,
                                    size: screenWidth * 0.06,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Coursepage extends StatefulWidget {
  const Coursepage({super.key});

  @override
  State<Coursepage> createState() => _CoursepageState();
}
