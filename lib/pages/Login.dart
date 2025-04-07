
import 'package:flutter/material.dart';
import 'package:skillsphere/pages/Bottomnavbar.dart';
import 'package:skillsphere/pages/PhoneNumberScreen.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hey Champ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Let's Step into Your Zone",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>BottomNavbar()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFFFF3D40)
              ),
              child: Text('Login',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigate to sign up page
              },
              child: Text("Don't Have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}