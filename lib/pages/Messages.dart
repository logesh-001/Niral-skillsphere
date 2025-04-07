import 'package:flutter/material.dart';

class Meassagespage extends StatefulWidget {
  const Meassagespage({super.key});

  @override
  State<Meassagespage> createState() => _MeassagespageState();
}

class _MeassagespageState extends State<Meassagespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Messages"),
      ),
    );
  }
}