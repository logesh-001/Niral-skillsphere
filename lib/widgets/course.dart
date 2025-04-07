import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CourseProgressTile extends StatelessWidget {
  final String title;
  final int progress;
  final int total;

  const CourseProgressTile({
    super.key,
    required this.title,
    required this.progress,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = progress / total; // Calculate progress percentage

    return ListTile(
      leading: CircularPercentIndicator(
        radius: 16, // Adjust size
        lineWidth: 4,
        percent: percentage,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.black, // Active progress color
        backgroundColor: Colors.black12, // Inactive progress color
        center: Text(
          "", // Keep it empty for a clean UI
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        "$progress / $total",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
