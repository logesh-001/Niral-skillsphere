import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:skillsphere/pages/onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is ready
  // await Firebase.initializeApp(); // Initialize Firebase before app starts
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillSphere',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      home: OnboardingScreen(), // Ensure OnboardingScreen exists
    );
  }
}
