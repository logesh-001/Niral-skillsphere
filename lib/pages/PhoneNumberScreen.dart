
import 'package:flutter/material.dart';
import 'package:skillsphere/pages/Bottomnavbar.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  String phoneNumber = "+91 ";

  void _onKeyPressed(String value) {
    setState(() {
      if (value == "delete") {
        if (phoneNumber.length > 4) {
          phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
        }
      } else {
        if (phoneNumber.length < 14) {
          phoneNumber += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Padding(
              padding: EdgeInsets.only(top: 16,bottom: 16,left: 16),
              child: Icon(Icons.visibility_off, color: Colors.black54),
            ),Text(
            "Continue with Phone",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),SizedBox()],
          ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: 
          // ),
          
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Image.asset("assets/images/Vector.png", height: 100), // Replace with actual asset
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Enter Your Phone Number",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Text(
                            phoneNumber,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavbar()));
                        },
                        style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF3D40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        ),
                        child: Text("Continue", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  _buildNumberPad(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberPad() {
    return Column(
      children: [
        for (var row in [
          ["1", "2", "3"],
          ["4", "5", "6"],
          ["7", "8", "9"],
          ["0", "delete"]
        ])
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((value) {
              return _buildNumberKey(value);
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildNumberKey(String value) {
    return GestureDetector(
      onTap: () => _onKeyPressed(value),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: value == "delete"
              ? Icon(Icons.backspace, size: 24, color: Colors.black)
              : Text(
                  value,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}