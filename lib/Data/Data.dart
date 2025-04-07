import 'dart:math';

class SliderItem {
  final String text;
  final String imagePath;

  SliderItem({required this.text, required this.imagePath});
}

List<SliderItem> sliderData = [
  SliderItem(
    text: "What do you want to learn today?",
    imagePath: "assets/images/illustration (1).png",
  ),
  SliderItem(
    text: "Keep learning new skills!",
    imagePath: "assets/images/illustration (1).png",
  ),
  SliderItem(
    text: "Boost your career with knowledge!",
    imagePath: "assets/images/illustration (1).png",
  ),
];

class progData {
  final String title;
  final int prog;
  final int total;
  progData({required this.title, required this.prog, required this.total});
}

final List<progData> courses = [
  progData(title: "Packaging Design", prog: 40, total: 40),
  progData(title: "Product Design", prog: 6, total: 24),
  progData(title: "UI/UX Design", prog: 12, total: 30),
  progData(title: "Web Development", prog: 18, total: 36),
  progData(title: "Flutter Development", prog: 22, total: 50),
];

// Define the lessonData class
class lessonData {
  final String title;
  final int duration; // Duration in minutes
  final bool isCompleted;

  lessonData({
    required this.title,
    required this.duration,
    required this.isCompleted,
  });
}

// Function to generate random lesson data
List<lessonData> generateRandomLessons(int count) {
  final Random random = Random();
  final List<String> lessonTitles = [
    "Introduction to Flutter",
    "State Management Basics",
    "Working with Widgets",
    "Animations in Flutter",
    "Database Integration",
    "Networking in Flutter",
    "Building Responsive UI",
    "Flutter & Firebase",
    "Deploying Flutter Apps",
    "Error Handling in Flutter",
  ];

  return List.generate(count, (index) {
    int duration = random.nextInt(10) + 5; // 5 to 15 minutes
    bool isCompleted = random.nextBool(); // Random completion

    return lessonData(
      title: lessonTitles[random.nextInt(lessonTitles.length)],
      duration: duration,
      isCompleted: isCompleted,
    );
  });
}
