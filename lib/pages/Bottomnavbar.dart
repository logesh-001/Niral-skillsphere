import 'package:flutter/material.dart';
import 'package:skillsphere/pages/Coursepage.dart';
import 'package:skillsphere/pages/Home.dart';
import 'package:skillsphere/pages/Messages.dart';
import 'package:skillsphere/pages/Profile.dart';
import 'package:skillsphere/pages/Search.dart';

class BottomNavbar extends StatefulWidget {
  static final GlobalKey<_BottomNavbarState> bottomNavbarKey = GlobalKey<_BottomNavbarState>();
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  int _selectedindex=0;

  final List<Widget> _pages=[Home(), Coursepage(),Searchpage(),Meassagespage(),Profile()];

  void onItemTapped(int index){
    setState(() {
      _selectedindex =index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(currentIndex: _selectedindex,
      onTap: onItemTapped,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      items: [BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Profile",
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )],
      
      ),
    );
  }
}