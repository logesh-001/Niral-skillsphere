import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Account ')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/Avatar.jpg',
                    ), // Replace with your dummy image path
                  ),
                ),
                SizedBox(height: 20),

                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Favourite'),
                  onTap: () {
                    // Handle Favourite tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit Account'),
                  onTap: () {
                    // Handle Edit Account tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings and Privacy'),
                  onTap: () {
                    // Handle Settings and Privacy tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () {
                    // Handle Help tap
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
