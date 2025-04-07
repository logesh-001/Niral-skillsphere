import 'package:flutter/material.dart';
import 'package:skillsphere/CourseDetails.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CourseDetailPage());
  }
}
